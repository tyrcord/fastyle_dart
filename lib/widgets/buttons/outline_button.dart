import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastOutlineButton extends StatelessWidget {
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

  const FastOutlineButton({
    Key key,
    @required this.onTap,
    this.emphasis = FastButtonEmphasis.low,
    this.highlightedBorderColor,
    this.isEnabled = true,
    this.highlightColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = borderColor ?? emphasis == FastButtonEmphasis.high
        ? ThemeHelper.colors.getPrimaryColor(context)
        : ThemeHelper.texts.getButtonTextStyle(context).color;

    final disabledColor = _color.withAlpha(kDisabledAlpha);

    return FastButtonLayout(
      child: OutlineButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        borderSide: BorderSide(color: _color),
        disabledBorderColor: disabledColor,
        textColor: textColor ?? _color,
        highlightColor: highlightColor,
        highlightedBorderColor: highlightedBorderColor ?? disabledColor,
        child: child ??
            FastButtonLabel(
              text: text,
              textColor: isEnabled ? _color : disabledColor,
            ),
      ),
    );
  }
}
