import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTextButton extends FastButton {
  @override
  const FastTextButton({
    required super.onTap,
    super.trottleTimeDuration,
    super.shouldTrottleTime,
    super.highlightColor,
    super.isEnabled,
    super.textColor,
    super.upperCase,
    super.emphasis,
    super.padding,
    super.child,
    super.text,
    super.key,
  })  : assert(
          child == null || text == null,
          'child and text properties cannot be initialized at the same time',
        ),
        assert(
          child != null || text != null,
          'child or text properties must be initialized',
        );

  @override
  _FastTextButtonState createState() => _FastTextButtonState();
}

class _FastTextButtonState extends State<FastTextButton>
    with FastThrottleButtonMixin, FastButtonSyleMixin {
  @override
  void dispose() {
    unsubscribeToTrottlerEventsIfNeeded();
    trottler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.textColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color!);

    return TextButton(
      style: ButtonStyle(
        overlayColor: getOverlayColor(textColor),
        padding: getButtonPadding(),
        shape: getButtonShape(),
      ),
      onPressed: throttleOnTapIfNeeded(),
      child: widget.child ??
          buildButtonLabel(
            textColor,
            upperCase: widget.upperCase,
          ),
    );
  }
}
