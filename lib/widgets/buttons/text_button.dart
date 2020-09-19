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
    FastButtonEmphasis emphasis = FastButtonEmphasis.low,
    bool isEnabled = true,
    this.highlightColor,
    this.textColor,
    this.padding,
    this.child,
    this.text,
  })  : this.isEnabled = isEnabled ?? true,
        this.emphasis = emphasis ?? FastButtonEmphasis.low,
        assert(onTap != null),
        super(key: key);

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
