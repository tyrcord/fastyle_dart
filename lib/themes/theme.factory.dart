import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/themes/dark/dark.theme.dart';
import 'package:fastyle_dart/themes/light/light.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeFactory {
  static ThemeData buildLightThemeWithColors(
    CupertinoDynamicColor primaryColor,
    Color secondaryColor,
    Color tertiaryColor,
  ) {
    return buildWithColors(
      kLightFastTheme,
      primaryColor.color,
      primaryColor.highContrastColor,
      secondaryColor,
      tertiaryColor,
    );
  }

  static ThemeData buildDarkThemeWithColors(
    CupertinoDynamicColor primaryColor,
    Color secondaryColor,
    Color tertiaryColor,
  ) {
    return buildWithColors(
      kDarkFastTheme,
      primaryColor.darkColor,
      primaryColor.darkHighContrastColor,
      secondaryColor,
      tertiaryColor,
    );
  }

  static ThemeData buildWithColors(
    ThemeData baseTheme,
    Color primaryColor,
    Color primaryColorDark,
    Color secondaryColor,
    Color tertiaryColor,
  ) {
    final textTheme = baseTheme.textTheme;

    return baseTheme.copyWith(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      accentColor: secondaryColor,
      buttonColor: primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      textTheme: textTheme.copyWith(
        caption: textTheme.caption.copyWith(
          color: secondaryColor,
        ),
        overline: textTheme.overline.copyWith(
          color: tertiaryColor,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        disabledColor: primaryColor.withAlpha(155),
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: kFastBorderSize,
          ),
        ),
      ),
    );
  }
}
