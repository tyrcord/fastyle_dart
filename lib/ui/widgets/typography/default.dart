import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

/// DISPLAY 1
/// 48px
/// regular
/// lowercase
class FastDisplay extends FastBaseTypography {
  const FastDisplay({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getDisplayTextStyle(context);
  }
}

/// HEADLINE
/// 34px
/// medium
/// lowercase
class FastHeadline extends FastBaseTypography {
  const FastHeadline({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getHeadlineTextStyle(context);
  }
}

/// PLACEHOLDER HEADLINE
/// 34px
/// light
/// lowercase
class FastPlaceHolderHeadline extends FastBaseTypography {
  const FastPlaceHolderHeadline({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

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
    required String text,
    super.key,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super(text: text.toUpperCase());

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getSubheadTextStyle(context);
  }
}

/// TITLE
/// 24px
/// regular
/// lowercase
class FastTitle extends FastBaseTypography {
  const FastTitle({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super(letterSpacing: 1.2);

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getTitleTextStyle(context);
  }
}

/// PLACEHOLDER TITLE
/// 24px
/// light
/// lowercase
class FastPlaceholderTitle extends FastBaseTypography {
  const FastPlaceholderTitle({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getPlaceHolderTitleTextStyle(context);
  }
}

/// SUBTITLE
/// 16px
/// semibold
/// lowercase
class FastSubtitle extends FastBaseTypography {
  const FastSubtitle({
    required super.text,
    super.key,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super();

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
  const FastBody({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super();

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
  const FastBody2({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super();

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
  const FastPlaceholder({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

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
    required String text,
    super.key,
    super.enableInteractiveSelection = false,
    super.overflow = TextOverflow.ellipsis,
    super.lineHeight = kFastLineHeight,
    super.textAlign = TextAlign.left,
    super.softWrap = false,
    super.fontWeight,
    super.textColor,
    super.fontSize,
    super.maxLines,
  }) : super(text: text.toUpperCase());

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
  const FastCaption({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  }) : super();

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
  const FastHelper({
    super.key,
    required super.text,
    super.enableInteractiveSelection = false,
    super.textAlign = TextAlign.left,
    super.lineHeight = kFastLineHeight,
    super.fontWeight,
    super.overflow,
    super.textColor,
    super.fontSize,
    super.maxLines,
    super.softWrap,
  });

  @override
  TextStyle getDefaultTextStyle(BuildContext context) {
    return ThemeHelper.texts.getOverlineTextStyle(context);
  }
}
