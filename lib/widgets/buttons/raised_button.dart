import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FastRaisedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;
  final Color highlightColor;
  final EdgeInsetsGeometry padding;

  const FastRaisedButton({
    Key key,
    @required this.onTap,
    this.text,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.highlightColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _backgroundColor = backgroundColor ?? theme.primaryColor;
    final _textColor = textColor ??
        ThemeHelper.colors.getColorWithBestConstrast(
          context: context,
          darkColor: ThemeHelper.texts.getButtonTextStyle(context).color,
          lightColor: ThemeHelper.colors.getWhiteColor(context),
          backgroundColor: _backgroundColor,
        );

    return FastButtonLayout(
      child: RaisedButton(
        color: _backgroundColor,
        padding: padding,
        onPressed: isEnabled ? onTap : null,
        splashColor: Colors.transparent,
        highlightColor: highlightColor,
        child: FastButtonLabel(
          text: text,
          textColor: isEnabled ? _textColor : _textColor.withAlpha(155),
        ),
      ),
    );
  }
}
