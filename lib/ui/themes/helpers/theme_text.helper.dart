import 'package:flutter/material.dart';

class ThemeTextHelper {
  TextStyle getDisplayTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline4!;
  }

  TextStyle getHeadlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline5!;
  }

  TextStyle getPlaceHolderHeadlineTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.headline5!.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getSubheadLineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!;
  }

  TextStyle getTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6!;
  }

  TextStyle getPlaceHolderTitleTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.headline6!.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getSubtitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!;
  }

  TextStyle getBodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!;
  }

  TextStyle getBody2TextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!;
  }

  TextStyle getPlaceholderTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w300,
      color: theme.hintColor,
    );
  }

  TextStyle getButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.button!;
  }

  TextStyle getCaptionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.caption!;
  }

  TextStyle getOverlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.overline!;
  }
}
