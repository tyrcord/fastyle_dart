import 'package:fastyle_dart/themes/base/base.dart';
import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kLineHeight = 1.2;

class FastBaseTypography extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final bool useFontForNumber;
  final double lineHeight;

  const FastBaseTypography({
    Key key,
    @required this.text,
    this.textColor,
    this.fontSize,
    this.lineHeight,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    TextAlign textAlign = TextAlign.left,
    bool useFontForNumber = false,
  })  : assert(text != null),
        this.textAlign = textAlign ?? TextAlign.left,
        this.useFontForNumber = useFontForNumber ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = getDefaultTextStyle(context);

    return Text(
      text,
      textAlign: textAlign,
      style: textStyle.copyWith(
        height: lineHeight ?? _kLineHeight,
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        fontFamily:
            useFontForNumber ? kFastFontForNumber : textStyle.fontFamily,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBodyTextStyle(context);
  }
}
