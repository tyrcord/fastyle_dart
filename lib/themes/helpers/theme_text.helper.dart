import 'package:flutter/material.dart';

class ThemeTextHelper {
  TextStyle getDisplayTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.display1;
  }

  TextStyle getHeadlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline;
  }

  TextStyle getPlaceHolderHeadlineTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.headline.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getSubheadLineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subhead;
  }

  TextStyle getTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.title;
  }

  TextStyle getPlaceHolderTitleTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.title.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getSubtitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle;
  }

  TextStyle getBodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.body1;
  }

  TextStyle getBody2TextStyle(BuildContext context) {
    return Theme.of(context).textTheme.body2;
  }

  TextStyle getPlaceholderTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.body1.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.button;
  }

  TextStyle getCaptionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.caption;
  }

  TextStyle getOverlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.overline;
  }
}
