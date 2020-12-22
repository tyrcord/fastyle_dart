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
  const FastDisplay({
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          useFontForNumber: useFontForNumber,
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          letterSpacing: 1.2,
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    Key key,
    @required String text,
    Color textColor,
    TextAlign textAlign,
    double fontSize,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow,
    bool useFontForNumber = false,
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
          lineHeight: lineHeight,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
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
    bool enableInteractiveSelection = false,
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
          enableInteractiveSelection: enableInteractiveSelection ?? false,
        );

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getOverlineTextStyle(context);
  }
}
