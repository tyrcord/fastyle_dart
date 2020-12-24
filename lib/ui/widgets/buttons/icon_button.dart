import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastIconButton extends StatefulWidget implements IFastButton {
  final Widget icon;

  final Color iconColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final FastButtonEmphasis emphasis;
  final String tooltip;

  @override
  final bool shouldTrottleTime;

  @override
  final Duration trottleTimeDuration;

  @override
  final VoidCallback onTap;

  @override
  final bool isEnabled;

  const FastIconButton({
    Key key,
    @required this.onTap,
    @required this.icon,
    this.iconColor,
    this.highlightColor,
    this.iconSize,
    bool isEnabled = true,
    EdgeInsetsGeometry padding = kFastEdgeInsets8,
    FastButtonEmphasis emphasis = FastButtonEmphasis.low,
    this.tooltip,
    bool shouldTrottleTime = false,
    Duration trottleTimeDuration = kFastTrottleTimeDuration,
  })  : isEnabled = isEnabled ?? true,
        padding = padding ?? kFastEdgeInsets8,
        emphasis = emphasis ?? FastButtonEmphasis.low,
        shouldTrottleTime = shouldTrottleTime ?? false,
        trottleTimeDuration = trottleTimeDuration ?? kFastTrottleTimeDuration,
        assert(onTap != null),
        assert(icon != null),
        super(key: key);

  @override
  _FastIconButtonState createState() => _FastIconButtonState();
}

class _FastIconButtonState extends State<FastIconButton>
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
    final _color = widget.iconColor ??
        (widget.emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color);

    return FastButtonLayout(
      child: IconButton(
        padding: widget.padding,
        onPressed: widget.isEnabled ? widget.onTap : null,
        highlightColor: widget.highlightColor,
        icon: widget.icon,
        iconSize: widget.iconSize ?? kFastIconSize,
        disabledColor: _color.withAlpha(kDisabledAlpha),
        color: _color,
        tooltip: widget.tooltip,
      ),
    );
  }
}