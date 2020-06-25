import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FastTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isEnabled;
  final Color textColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;
  final FastButtonEmphasis emphasis;

  const FastTextButton({
    Key key,
    @required this.onTap,
    this.text,
    this.isEnabled = true,
    this.textColor,
    this.highlightColor,
    this.padding,
    this.emphasis = FastButtonEmphasis.low,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color _color = textColor ?? emphasis == FastButtonEmphasis.high
        ? theme.primaryColor
        : ThemeHelper.texts.getButtonTextStyle(context).color;

    Color disabledColor = _color.withAlpha(155);

    return FastButtonLayout(
      child: FlatButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        highlightColor: highlightColor,
        child: FastButtonLabel(
          text: text,
          textColor: isEnabled ? _color : disabledColor,
        ),
      ),
    );
  }
}
