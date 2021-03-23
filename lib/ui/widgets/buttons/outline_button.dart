import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastOutlineButton extends StatefulWidget implements IFastButton {
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry? padding;
  final Color? highlightColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? child;
  final String? text;

  @override
  final bool shouldTrottleTime;
  @override
  final Duration trottleTimeDuration;
  @override
  final VoidCallback onTap;
  @override
  final bool isEnabled;

  const FastOutlineButton({
    Key? key,
    required this.onTap,
    this.highlightColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
    this.emphasis = FastButtonEmphasis.low,
    this.trottleTimeDuration = kFastTrottleTimeDuration,
    this.shouldTrottleTime = false,
    this.isEnabled = true,
  })  : assert(
          child == null || text == null,
          'child and text properties cannot be initialized at the same time',
        ),
        assert(
          child != null || text != null,
          'child or text properties must be initialized',
        ),
        super(key: key);

  @override
  _FastOutlineButtonState createState() => _FastOutlineButtonState();
}

class _FastOutlineButtonState extends State<FastOutlineButton>
    with FastThrottleButtonMixin {
  @override
  void initState() {
    super.initState();
    subscribeToTrottlerEvents();
  }

  @override
  void dispose() {
    unsubscribeToTrottlerEventsIfNeeded();
    trottler.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = ThemeHelper.texts.getButtonTextStyle(context);
    final borderColor = widget.borderColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : buttonTextStyle.color!);

    final disabledColor = borderColor.withAlpha(kDisabledAlpha);
    final textColor = widget.textColor ?? borderColor;

    return FastButtonLayout(
      child: OutlinedButtonTheme(
        data: OutlinedButtonThemeData(
          style: ButtonStyle(),
        ),
        child: OutlinedButton(
          onPressed: throttleOnTapIfNeeded(),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return widget.highlightColor ?? textColor.withOpacity(0.1);
            }),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                (Set<MaterialState> states) {
              return widget.padding;
            }),
            side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
              return BorderSide(
                color: widget.isEnabled ? borderColor : disabledColor,
              );
            }),
          ),
          child: widget.child ?? _buildLabel(textColor, disabledColor),
        ),
      ),
    );
  }

  Widget _buildLabel(Color textColor, Color disabledTextColor) {
    return FastButtonLabel(
      text: widget.text ?? kFastButtonLabel,
      textColor: widget.isEnabled ? textColor : disabledTextColor,
    );
  }
}
