import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastBaseTypography extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool useFontForNumber;
  final double lineHeight;
  final double? letterSpacing;
  final bool enableInteractiveSelection;

  const FastBaseTypography({
    Key? key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.lineHeight = kFastLineHeight,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.textAlign = TextAlign.left,
    this.useFontForNumber = false,
    this.enableInteractiveSelection = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = getDefaultTextStyle(context).copyWith(
      height: lineHeight,
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
