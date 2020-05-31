import 'package:fastyle_dart/widgets/typography/base.dart';
import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

/// DISPLAY 1
/// 34px
/// regular
/// lowercase
class FastDisplay extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastDisplay({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

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
  FastHeadline({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          lineHeight: lineHeight,
        );

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
  FastPlaceHolderHeadline({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceHolderHeadlineTextStyle(context);
  }
}

/// SUBHEAD
/// 17px
/// semibold
/// uppercase
class FastSubhead extends FastBaseTypography {
  FastSubhead({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          textAlign: textAlign,
          text: text.toUpperCase(),
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getSubheadLineTextStyle(context);
  }
}

/// TITLE
/// 20px
/// regular
/// lowercase
class FastTitle extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastTitle({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

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
  FastPlaceholderTitle({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceHolderTitleTextStyle(context);
  }
}

/// SUBTITLE
/// 15px
/// semibold
/// uppercase
class FastSubtitle extends FastBaseTypography {
  FastSubtitle({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          textAlign: textAlign,
          text: text.toUpperCase(),
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getSubtitleTextStyle(context);
  }
}

/// BODY 1
/// 17px
/// normal
/// lowercase
class FastBody extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastBody({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber ?? false,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBodyTextStyle(context);
  }
}

/// BODY 2
/// 17px
/// normal
/// lowercase
class FastBody2 extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastBody2({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getBody2TextStyle(context);
  }
}

/// PLACEHOLDER
/// 17px
/// light
/// lowercase
class FastPlaceholder extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastPlaceholder({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceholderTextStyle(context);
  }
}

/// BUTTON
/// 15px
/// semibold
/// uppercase
class FastButtonLabel extends FastBaseTypography {
  FastButtonLabel({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          textAlign: textAlign,
          text: text.toUpperCase(),
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getButtonTextStyle(context);
  }
}

/// CAPTION
/// 15px
/// light
/// lowercase
class FastCaption extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastCaption({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getCaptionTextStyle(context);
  }
}

/// HELPER
/// 13px
/// light
/// lowercase
class FastHelper extends FastBaseTypography {
  // FIXME!
  // https://github.com/dart-lang/sdk/issues/9468
  FastHelper({
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    double lineHeight,
  }) : super(
          key: key,
          text: text,
          textAlign: textAlign,
          textColor: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          overflow: overflow,
          useFontForNumber: useFontForNumber,
          lineHeight: lineHeight,
        );

  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getOverlineTextStyle(context);
  }
}
