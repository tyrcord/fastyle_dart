import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final bool isEnabled;
  final Color iconColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final FastButtonEmphasis emphasis;
  final String tooltip;

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
  })  : this.isEnabled = isEnabled ?? true,
        this.padding = padding ?? kFastEdgeInsets8,
        this.emphasis = emphasis ?? FastButtonEmphasis.low,
        assert(onTap != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = iconColor ??
        (emphasis == FastButtonEmphasis.high
            ? ThemeHelper.colors.getPrimaryColor(context)
            : ThemeHelper.texts.getButtonTextStyle(context).color);

    return FastButtonLayout(
      child: IconButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        highlightColor: highlightColor,
        icon: icon,
        iconSize: iconSize ?? kFastIconSize,
        disabledColor: _color.withAlpha(kDisabledAlpha),
        color: _color,
        tooltip: tooltip,
      ),
    );
  }
}
