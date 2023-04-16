import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastFilledButton extends FastButton {
  final Color? backgroundColor;
  final double? elevation;
  final double? fontSize;

  const FastFilledButton({
    required super.onTap,
    super.trottleTimeDuration,
    super.shouldTrottleTime,
    super.highlightColor,
    super.overlayColor,
    super.isEnabled,
    super.textColor,
    super.padding,
    super.child,
    super.text,
    super.key,
    this.backgroundColor,
    this.elevation,
    this.fontSize,
  })  : assert(
          child == null || text == null,
          'child and text properties cannot be initialized at the same time',
        ),
        assert(
          child != null || text != null,
          'child or text properties must be initialized',
        );

  @override
  FastFilledButtonState createState() => FastFilledButtonState();
}

class FastFilledButtonState extends State<FastFilledButton>
    with FastThrottleButtonMixin, FastButtonSyleMixin {
  @override
  void dispose() {
    unsubscribeToTrottlerEventsIfNeeded();
    trottler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.colors;
    final backgroundColor =
        widget.backgroundColor ?? colors.getPrimaryColor(context);
    final palette = ThemeHelper.getPaletteColors(context);
    final textColor = widget.textColor ??
        colors.getColorWithBestConstrast(
          context: context,
          darkColor: ThemeHelper.texts.getButtonTextStyle(context).color!,
          lightColor: palette.whiteColor,
          backgroundColor: backgroundColor,
        );

    return FilledButton(
      onPressed: throttleOnTapIfNeeded(),
      style: FilledButton.styleFrom(
        foregroundColor: widget.highlightColor,
        padding: widget.padding,
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        disabledBackgroundColor: backgroundColor.withOpacity(0.5),
        backgroundColor: backgroundColor,
      ),
      child: widget.child ??
          buildButtonLabel(
            textColor,
            fontSize: widget.fontSize,
          ),
    );
  }
}
