import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastRaisedButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color highlightColor;
  final VoidCallback onTap;
  final Color textColor;
  final bool isEnabled;
  final Widget child;
  final String text;

  const FastRaisedButton({
    Key key,
    @required this.onTap,
    this.isEnabled = true,
    this.backgroundColor,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _backgroundColor =
        backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context);
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
        child: child ??
            FastButtonLabel(
              text: text,
              textColor:
                  isEnabled ? _textColor : _textColor.withAlpha(kDisabledAlpha),
            ),
      ),
    );
  }
}
