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
    this.isEnabled = true,
    this.backgroundColor,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
    this.shouldTrottleTime = false,
    this.trottleTimeDuration = kFastTrottleTimeDuration,
  }) : super(key: key);

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
    final _backgroundColor =
        widget.backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context);
    final _textColor = widget.textColor ??
        ThemeHelper.colors.getColorWithBestConstrast(
          context: context,
          darkColor: ThemeHelper.texts.getButtonTextStyle(context).color!,
          lightColor: ThemeHelper.colors.getWhiteColor(context),
          backgroundColor: _backgroundColor,
        );

    return FastButtonLayout(
      child: RaisedButton(
        color: _backgroundColor,
        padding: widget.padding,
        onPressed: throttleOnTapIfNeeded(),
        splashColor: Colors.transparent,
        highlightColor: widget.highlightColor,
        child: widget.child ??
            FastButtonLabel(
              text: widget.text ?? kFastButtonLabel,
              textColor: widget.isEnabled
                  ? _textColor
                  : _textColor.withAlpha(kDisabledAlpha),
            ),
      ),
    );
  }
}
