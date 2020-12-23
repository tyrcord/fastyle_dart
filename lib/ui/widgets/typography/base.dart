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
  final double letterSpacing;
  final bool enableInteractiveSelection;

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
    this.letterSpacing,
    bool enableInteractiveSelection = false,
  })  : assert(text != null),
        enableInteractiveSelection = enableInteractiveSelection ?? false,
        textAlign = textAlign ?? TextAlign.left,
        useFontForNumber = useFontForNumber ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = getDefaultTextStyle(context).copyWith(
      height: lineHeight ?? _kLineHeight,
      fontSize: fontSize,
      color: textColor,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      fontFamily: useFontForNumber ? kFastFontForNumber : null,
    );

    if (enableInteractiveSelection) {
      return SelectableText(
        text,
        textAlign: textAlign,
        style: textStyle,
        maxLines: maxLines,
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBodyTextStyle(context);
  }
}
