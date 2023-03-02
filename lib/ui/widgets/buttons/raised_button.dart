import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastRaisedButton extends FastButton {
  final Color? backgroundColor;

  const FastRaisedButton({
    required super.onTap,
    super.trottleTimeDuration,
    super.shouldTrottleTime,
    super.highlightColor,
    super.isEnabled,
    super.textColor,
    super.padding,
    super.child,
    super.text,
    super.key,
    this.backgroundColor,
  })  : assert(
          child == null || text == null,
          'child and text properties cannot be initialized at the same time',
        ),
        assert(
          child != null || text != null,
          'child or text properties must be initialized',
        );

  @override
  FastRaisedButtonState createState() => FastRaisedButtonState();
}

class FastRaisedButtonState extends State<FastRaisedButton>
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

    return ElevatedButton(
      onPressed: throttleOnTapIfNeeded(),
      style: ButtonStyle(
        overlayColor: getOverlayColor(textColor),
        padding: getButtonPadding(),
        shape: getButtonShape(),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.disabled)) {
            return backgroundColor.withOpacity(0.5);
          }

          return backgroundColor;
        }),
      ),
      child: widget.child ?? buildButtonLabel(textColor),
    );
  }
}
