import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastIconButton extends StatefulWidget implements IFastButton {
  final VoidCallback onTap;
  final Widget icon;
  final bool isEnabled;
  final Color iconColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final FastButtonEmphasis emphasis;
  final String tooltip;
  final bool shouldTrottleTime;
  final Duration trottleTimeDuration;

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
  })  : this.isEnabled = isEnabled ?? true,
        this.padding = padding ?? kFastEdgeInsets8,
        this.emphasis = emphasis ?? FastButtonEmphasis.low,
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
