import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastBaseTypography extends StatelessWidget {
  final bool enableInteractiveSelection;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final bool useFontForNumber;
  final double? letterSpacing;
  final TextAlign textAlign;
  final double lineHeight;
  final Color? textColor;
  final double? fontSize;
  final int? maxLines;
  final String text;

  const FastBaseTypography({
    Key? key,
    required this.text,
    this.enableInteractiveSelection = false,
    this.lineHeight = kFastLineHeight,
    this.textAlign = TextAlign.left,
    this.useFontForNumber = false,
    this.fontWeight,
    this.textColor,
    this.fontSize,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
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
