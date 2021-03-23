import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

/// DISPLAY 1
/// 34px
/// regular
/// lowercase
class FastDisplay extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastDisplay({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getDisplayTextStyle(context);
  }
}

/// HEADLINE
/// 28px
/// semibold
/// lowercase
class FastHeadline extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastHeadline({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getHeadlineTextStyle(context);
  }
}

/// PLACEHOLDER HEADLINE
/// 28px
/// light
/// lowercase
class FastPlaceHolderHeadline extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastPlaceHolderHeadline({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceHolderHeadlineTextStyle(context);
  }
}

/// SUBHEAD
/// 18px
/// semibold
/// uppercase
class FastSubhead extends FastBaseTypography {
  FastSubhead({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          text: text.toUpperCase(),
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getSubheadLineTextStyle(context);
  }
}

/// TITLE
/// 24px
/// regular
/// lowercase
class FastTitle extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastTitle({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          letterSpacing: 1.2,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getTitleTextStyle(context);
  }
}

/// PLACEHOLDER TITLE
/// 22px
/// light
/// lowercase
class FastPlaceholderTitle extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastPlaceholderTitle({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceHolderTitleTextStyle(context);
  }
}

/// SUBTITLE
/// 16px
/// semibold
/// uppercase
class FastSubtitle extends FastBaseTypography {
  FastSubtitle({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          text: text.toUpperCase(),
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getSubtitleTextStyle(context);
  }
}

/// BODY 1
/// 18px
/// normal
/// lowercase
class FastBody extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastBody({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBodyTextStyle(context);
  }
}

/// BODY 2
/// 18px
/// normal
/// lowercase
class FastBody2 extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastBody2({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBody2TextStyle(context);
  }
}

/// PLACEHOLDER
/// 18px
/// light
/// lowercase
class FastPlaceholder extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastPlaceholder({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceholderTextStyle(context);
  }
}

/// BUTTON
/// 16px
/// semibold
/// uppercase
class FastButtonLabel extends FastBaseTypography {
  FastButtonLabel({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          text: text.toUpperCase(),
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getButtonTextStyle(context);
  }
}

/// CAPTION
/// 16px
/// light
/// lowercase
class FastCaption extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastCaption({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getCaptionTextStyle(context);
  }
}

/// HELPER
/// 14px
/// light
/// lowercase
class FastHelper extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  const FastHelper({
    Key? key,
    required String text,
    bool enableInteractiveSelection = false,
    TextAlign textAlign = TextAlign.left,
    double lineHeight = kFastLineHeight,
    bool useFontForNumber = false,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    Color? textColor,
    double? fontSize,
    int? maxLines,
  }) : super(
          enableInteractiveSelection: enableInteractiveSelection,
          useFontForNumber: useFontForNumber,
          fontWeight: fontWeight,
          lineHeight: lineHeight,
          textColor: textColor,
          textAlign: textAlign,
          fontSize: fontSize,
          overflow: overflow,
          maxLines: maxLines,
          text: text,
          key: key,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getOverlineTextStyle(context);
  }
}
