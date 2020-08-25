import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';

class ThemeColorHelper {
  Color getColorWithBestConstrast({
    @required BuildContext context,
    @required Color darkColor,
    @required Color lightColor,
    Color backgroundColor,
  }) {
    final theme = Theme.of(context);
    final primaryColor = backgroundColor ?? theme.primaryColor;
    return primaryColor.computeLuminance() > 0.5 ? darkColor : lightColor;
  }

  Color getWhiteColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightWhiteColor
        : kFastDarkWhiteColor;
  }

  Color getBlueColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightBlueColor
        : kFastDarkBlueColor;
  }

  Color getGreenColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightGreenColor
        : kFastDarkGreenColor;
  }

  Color getOrangeColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightOrangeColor
        : kFastDarkOrangeColor;
  }

  Color getYellowColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightYellowColor
        : kFastDarkYellowColor;
  }

  Color getRedColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightRedColor
        : kFastDarkRedColor;
  }

  Color getShadowColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightShadowColor
        : kFastDarkShadowColor;
  }

  Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  Color getSecondaryColor(BuildContext context) {
    return Theme.of(context).accentColor;
  }

  Color getTertiaryColor(BuildContext context) {
    return Theme.of(context).textTheme.overline.color;
  }

  Color getHintColor(BuildContext context) {
    return Theme.of(context).hintColor;
  }
}
