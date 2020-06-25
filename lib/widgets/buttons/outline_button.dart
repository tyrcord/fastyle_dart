import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FastOutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isEnabled;
  final Color borderColor;
  final Color highlightColor;
  final Color highlightedBorderColor;
  final EdgeInsetsGeometry padding;
  final FastButtonEmphasis emphasis;

  const FastOutlineButton({
    Key key,
    @required this.onTap,
    this.text,
    this.isEnabled = true,
    this.borderColor,
    this.highlightColor,
    this.padding,
    this.emphasis = FastButtonEmphasis.low,
    this.highlightedBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _color = borderColor ?? emphasis == FastButtonEmphasis.high
        ? theme.primaryColor
        : ThemeHelper.texts.getButtonTextStyle(context).color;

    final disabledColor = _color.withAlpha(155);

    return FastButtonLayout(
      child: OutlineButton(
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        borderSide: BorderSide(
          color: _color,
        ),
        disabledBorderColor: disabledColor,
        highlightColor: highlightColor,
        highlightedBorderColor: highlightedBorderColor ?? disabledColor,
        child: FastButtonLabel(
          text: text,
          textColor: isEnabled ? _color : disabledColor,
        ),
      ),
    );
  }
}
