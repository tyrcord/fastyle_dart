import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc/tbloc.dart';

class ThemeTextHelper {
  Color getLabelColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightLabelColor
        : kFastDarkLabelColor;
  }

  Color getSecondaryLabelColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightSecondaryLabelColor
        : kFastDarkSecondaryLabelColor;
  }

  Color getTertiaryLabelColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightTertiaryLabelColor
        : kFastDarkTertiaryLabelColor;
  }

  TextStyle getDisplayTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline4!;
  }

  TextStyle getHeadlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline5!;
  }

  TextStyle getPlaceHolderHeadlineTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.headline5!.copyWith(
      fontWeight: kFastFontWeightLight,
      color: theme.hintColor,
    );
  }

  TextStyle getSubheadTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline3!;
  }

  TextStyle getTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6!;
  }

  TextStyle getPlaceHolderTitleTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.headline6!.copyWith(
      fontWeight: kFastFontWeightLight,
      color: theme.hintColor,
    );
  }

  TextStyle getSubtitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!;
  }

  TextStyle getSecondarySubtitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2!;
  }

  TextStyle getBodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!;
  }

  TextStyle getSecondaryBodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2!;
  }

  TextStyle getPlaceholderTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    return theme.textTheme.bodyText1!.copyWith(
      fontWeight: kFastFontWeightLight,
      color: theme.hintColor,
    );
  }

  TextStyle getButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.button!;
  }

  TextStyle getSecondaryButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.button!.copyWith(
          color: getTertiaryLabelColor(context),
          fontSize: kFastFontSize14,
        );
  }

  TextStyle getCaptionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.caption!;
  }

  TextStyle getSecondaryCaptionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.caption!.copyWith(
          color: getTertiaryLabelColor(context),
          fontWeight: kFastFontWeightMedium,
          fontSize: kFastFontSize12,
        );
  }

  TextStyle getOverlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.overline!;
  }

  TextStyle getSecondaryOverlineTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.overline!.copyWith(
          color: getTertiaryLabelColor(context),
          fontWeight: kFastFontWeightMedium,
          fontSize: kFastFontSize10,
        );
  }
}
