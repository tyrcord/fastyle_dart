import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FastIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final bool isEnabled;
  final Color iconColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final double iconSize;
  final FastButtonEmphasis emphasis;

  const FastIconButton({
    Key key,
    @required this.onTap,
    @required this.icon,
    this.isEnabled = true,
    this.iconColor,
    this.highlightColor,
    this.padding = kFastEdgeInsets8,
    this.emphasis = FastButtonEmphasis.low,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color _color = iconColor ??
        (emphasis == FastButtonEmphasis.high
            ? theme.primaryColor
            : theme.textTheme.button.color);

    Color disabledColor = _color.withAlpha(155);

    return FastButtonLayout(
      child: IconButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        highlightColor: highlightColor,
        icon: icon,
        iconSize: iconSize ?? kFastIconSize,
        disabledColor: disabledColor,
        color: _color,
      ),
    );
  }
}
