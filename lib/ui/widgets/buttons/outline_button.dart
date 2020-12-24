import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastOutlineButton extends StatefulWidget implements IFastButton {
  final Color highlightedBorderColor;
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry padding;
  final Color highlightColor;
  final Color borderColor;
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

  const FastOutlineButton({
    Key key,
    @required this.onTap,
    FastButtonEmphasis emphasis = FastButtonEmphasis.low,
    bool isEnabled = true,
    this.highlightedBorderColor,
    this.highlightColor,
    this.borderColor,
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
    final _color = widget.borderColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color);

    final disabledColor = _color.withAlpha(kDisabledAlpha);

    return FastButtonLayout(
      child: OutlineButton(
        padding: widget.padding,
        onPressed: throttleOnTapIfNeeded(),
        borderSide: BorderSide(color: _color),
        disabledBorderColor: disabledColor,
        textColor: widget.textColor ?? _color,
        highlightColor: widget.highlightColor,
        highlightedBorderColor: widget.highlightedBorderColor ?? disabledColor,
        child: widget.child ??
            FastButtonLabel(
              text: widget.text,
              textColor: widget.isEnabled ? _color : disabledColor,
            ),
      ),
    );
  }
}