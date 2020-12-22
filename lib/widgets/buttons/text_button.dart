import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastTextButton extends StatefulWidget implements IFastButton {
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry padding;
  final Color highlightColor;
  final Color textColor;
  final Widget child;
  final String text;

  @override
  final bool shouldTrottleTime;
  @override
  final Duration trottleTimeDuration;
  @override
  final VoidCallback onTap;
  @override
  final bool isEnabled;

  const FastTextButton({
    Key key,
    @required this.onTap,
    FastButtonEmphasis emphasis = FastButtonEmphasis.low,
    bool isEnabled = true,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
    bool shouldTrottleTime = false,
    Duration trottleTimeDuration = kFastTrottleTimeDuration,
  })  : isEnabled = isEnabled ?? true,
        emphasis = emphasis ?? FastButtonEmphasis.low,
        shouldTrottleTime = shouldTrottleTime ?? false,
        trottleTimeDuration = trottleTimeDuration ?? kFastTrottleTimeDuration,
        assert(onTap != null),
        super(key: key);

  @override
  _FastTextButtonState createState() => _FastTextButtonState();
}

class _FastTextButtonState extends State<FastTextButton>
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
    final _color = widget.textColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color);

    return FastButtonLayout(
      child: FlatButton(
        padding: widget.padding,
        onPressed: widget.isEnabled ? widget.onTap : null,
        highlightColor: widget.highlightColor,
        child: widget.child ??
            FastButtonLabel(
              text: widget.text,
              textColor: widget.isEnabled ? _color : _color.withAlpha(155),
            ),
      ),
    );
  }
}
