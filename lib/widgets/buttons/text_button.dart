import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastTextButton extends StatelessWidget {
  final FastButtonEmphasis emphasis;
  final EdgeInsetsGeometry padding;
  final Color highlightColor;
  final VoidCallback onTap;
  final Color textColor;
  final bool isEnabled;
  final Widget child;
  final String text;

  const FastTextButton({
    Key key,
    @required this.onTap,
    this.emphasis = FastButtonEmphasis.low,
    this.isEnabled = true,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = textColor ?? emphasis == FastButtonEmphasis.high
        ? ThemeHelper.colors.getPrimaryColor(context)
        : ThemeHelper.texts.getButtonTextStyle(context).color;

    return FastButtonLayout(
      child: FlatButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        highlightColor: highlightColor,
        child: child ??
            FastButtonLabel(
              text: text,
              textColor: isEnabled ? _color : _color.withAlpha(155),
            ),
      ),
    );
  }
}
