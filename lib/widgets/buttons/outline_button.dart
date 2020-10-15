import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastOutlineButton extends StatefulWidget implements IFastButton {
  final Color highlightedBorderColor;
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry padding;
  final Color highlightColor;
  final VoidCallback onTap;
  final Color borderColor;
  final Color textColor;
  final bool isEnabled;
  final Widget child;
  final String text;
  final bool shouldTrottleTime;
  final Duration trottleTimeDuration;
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
  })  : this.isEnabled = isEnabled ?? true,
        this.emphasis = emphasis ?? FastButtonEmphasis.low,
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
    final _color =
        widget.borderColor ?? widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color;

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
