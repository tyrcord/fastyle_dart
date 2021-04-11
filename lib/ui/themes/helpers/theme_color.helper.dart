import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class ThemeColorHelper {
  Color getColorWithBestConstrast({
    required BuildContext context,
    required Color darkColor,
    required Color lightColor,
    Color? backgroundColor,
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

  Color getBlueGrayColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightBlueGrayColor
        : kFastDarkBlueGrayColor;
  }

  Color getGreenColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightGreenColor
        : kFastDarkGreenColor;
  }

  Color getIndigoColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightIndigoColor
        : kFastDarkIndigoColor;
  }

  Color getOrangeColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightOrangeColor
        : kFastDarkOrangeColor;
  }

  Color getPinkColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightPinkColor
        : kFastDarkPinkColor;
  }

  Color getPurpleColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightPurpleColor
        : kFastDarkPurpleColor;
  }

  Color getRedColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightRedColor
        : kFastDarkRedColor;
  }

  Color getTealColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightTealColor
        : kFastDarkTealColor;
  }

  Color getYellowColor(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);

    return themeBloc.currentState.brightness == Brightness.light
        ? kFastLightYellowColor
        : kFastDarkYellowColor;
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
    return Theme.of(context).textTheme.overline!.color!;
  }

  Color getHintColor(BuildContext context) {
    return Theme.of(context).hintColor;
  }

  Color getPrimaryBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  Color getSecondaryBackgroundColor(BuildContext context) {
    return Theme.of(context).backgroundColor;
  }

  Brightness getBrightnessForColor({
    required BuildContext context,
    required Color color,
  }) {
    return color.computeLuminance() > 0.5 ? Brightness.light : Brightness.dark;
  }
}
