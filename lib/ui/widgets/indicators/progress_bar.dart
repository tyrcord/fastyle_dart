import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

/// A linear progress bar indicator.
class FastLinearProgressBarIndicator extends StatefulWidget {
  /// A callback that takes a [double] value and returns a [String].
  final StringCallback<double>? progressLabelBuilder;

  /// A callback that is called when the animation ends.
  final VoidCallback? onAnimationEnd;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The palette to use for the progress bar.
  final FastPaletteScheme? palette;

  /// The color of the progress label.
  final Color? progressLabelColor;

  /// Whether to show the progress label.
  final bool showProgressLabel;

  /// Whether to show the progress as a percentage.
  final bool showAsPercentage;

  /// The background color of the progress bar.
  final Color? backgroundColor;

  /// The minimum height of the progress bar.
  final double minBarHeight;

  /// The number of digits after the decimal point.
  final int fractionDigits;

  /// The radius of the progress bar.
  final double barRadius;

  /// The color of the progress bar.
  final Color? barColor;

  /// The minimum value of the progress bar.
  final double minValue;

  /// The maximum value of the progress bar.
  final double maxValue;

  /// The current value of the progress bar.
  final double value;

  /// Whether to animate the progress bar.
  final bool animate;

  const FastLinearProgressBarIndicator({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 300),
    this.showProgressLabel = false,
    this.showAsPercentage = false,
    this.fractionDigits = 2,
    this.minBarHeight = 8,
    this.maxValue = 100,
    this.animate = true,
    this.barRadius = 4,
    this.minValue = 0,
    this.value = 0,
    this.progressLabelBuilder,
    this.progressLabelColor,
    this.backgroundColor,
    this.onAnimationEnd,
    this.barColor,
    this.palette,
  }) : super(key: key);

  @override
  State<FastLinearProgressBarIndicator> createState() =>
      _FastLinearProgressBarIndicatorState();
}

class _FastLinearProgressBarIndicatorState
    extends State<FastLinearProgressBarIndicator> {
  double _progressBarWidth = 0;
  double _factor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildProgressBarBackground(context),
        buildProgressBarContainer(context),
        if (widget.showProgressLabel)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: buildProgressLabel(context),
            ),
          ),
      ],
    );
  }

  /// Builds the progress bar background.
  Widget buildProgressBarBackground(BuildContext context) {
    return Container(
      height: widget.minBarHeight,
      decoration: BoxDecoration(
        color: _getProgressBarBackgroundColor(context),
        borderRadius: BorderRadius.circular(widget.barRadius),
      ),
    );
  }

  /// Builds the progress bar container.
  /// If the [animate] property is set to true,
  /// the progress bar will be animated.
  /// Otherwise, the progress bar will be fixed.
  ///
  /// The [animate] property is set to true by default.
  Widget buildProgressBarContainer(BuildContext context) {
    if (widget.animate) {
      return buildAnimatedProgressBar(context);
    }

    return buildProgressBar(context);
  }

  /// Builds the animated progress bar.
  Widget buildAnimatedProgressBar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          handlePostFrame(timeStamp, constraints);
        });

        return AnimatedContainer(
          duration: widget.animationDuration,
          onEnd: widget.onAnimationEnd,
          width: _progressBarWidth,
          child: buildProgressBar(context),
        );
      },
    );
  }

  /// Builds the fixed progress bar.
  Widget buildProgressBar(BuildContext context) {
    return Container(
      height: widget.minBarHeight,
      decoration: BoxDecoration(
        color: _getProgressBarColor(context),
        borderRadius: BorderRadius.circular(widget.barRadius),
      ),
    );
  }

  /// Builds the progress label.
  Widget buildProgressLabel(BuildContext context) {
    String _label;

    if (widget.progressLabelBuilder != null) {
      _label = widget.progressLabelBuilder!(widget.value);
    } else if (widget.showAsPercentage) {
      _label = toPercentage(widget.value, widget.fractionDigits);
    } else {
      _label = widget.value.toStringAsFixed(widget.fractionDigits);
    }

    return FastOverline(
      textColor: _getProgressLabelColor(context),
      text: _label,
    );
  }

  /// Handles the post frame callback.
  void handlePostFrame(Duration timeStamp, BoxConstraints constraints) {
    // If the width value is the same as the max width constraints,
    // we don't need to update the width of the progress bar.
    if (_progressBarWidth == constraints.maxWidth) {
      return;
    }

    setState(() {
      var _value = widget.value;

      if (_value < widget.minValue) {
        _value = widget.minValue;
      }

      if (_value > widget.maxValue) {
        _value = widget.maxValue;
      }

      _factor = _value / widget.maxValue;
      _progressBarWidth = constraints.maxWidth * _factor;
    });
  }

  /// get the progress bar background color.
  Color _getProgressBarBackgroundColor(BuildContext context) {
    if (widget.palette != null) {
      return widget.palette!.ultraLight;
    } else if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }

    final palette = ThemeHelper.getPaletteColors(context);

    return palette.gray.ultraLight;
  }

  /// get the progress bar color.
  Color _getProgressBarColor(BuildContext context) {
    if (widget.palette != null) {
      return widget.palette!.mid;
    } else if (widget.barColor != null) {
      return widget.barColor!;
    }

    return ThemeHelper.colors.getPrimaryColor(context);
  }

  /// get the progress label color.
  Color _getProgressLabelColor(BuildContext context) {
    if (widget.progressLabelColor != null) {
      return widget.progressLabelColor!;
    }

    final _palette = ThemeHelper.getPaletteColors(context);
    final darkColor = _palette.gray.mid;
    final lightColor = _palette.whiteColor;

    return ThemeHelper.colors.getColorWithBestConstrast(
        context: context,
        darkColor: darkColor,
        lightColor: lightColor,
        backgroundColor: _factor >= 0.5
            ? _getProgressBarColor(context)
            : _getProgressBarBackgroundColor(context));
  }
}
