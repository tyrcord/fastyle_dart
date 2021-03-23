import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastRaisedButton extends StatefulWidget implements IFastButton {
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? highlightColor;
  @override
  final VoidCallback onTap;
  final Color? textColor;
  @override
  final bool isEnabled;
  final Widget? child;
  final String? text;
  @override
  final bool shouldTrottleTime;
  @override
  final Duration trottleTimeDuration;

  const FastRaisedButton({
    Key? key,
    required this.onTap,
    this.trottleTimeDuration = kFastTrottleTimeDuration,
    this.shouldTrottleTime = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
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
  _FastRaisedButtonState createState() => _FastRaisedButtonState();
}

class _FastRaisedButtonState extends State<FastRaisedButton>
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
    final backgroundColor =
        widget.backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context);
    final textColor = widget.textColor ??
        ThemeHelper.colors.getColorWithBestConstrast(
          context: context,
          darkColor: ThemeHelper.texts.getButtonTextStyle(context).color!,
          lightColor: ThemeHelper.colors.getWhiteColor(context),
          backgroundColor: backgroundColor,
        );

    return FastButtonLayout(
      child: ElevatedButton(
        onPressed: throttleOnTapIfNeeded(),
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
              (Set<MaterialState> states) {
            return widget.padding;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return backgroundColor.withOpacity(0.5);
            }

            return backgroundColor;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return widget.highlightColor ?? textColor.withOpacity(0.1);
          }),
        ),
        child: widget.child ??
            FastButtonLabel(
              text: widget.text ?? kFastButtonLabel,
              textColor: widget.isEnabled
                  ? textColor
                  : textColor.withAlpha(kDisabledAlpha),
            ),
      ),
    );
  }
}
