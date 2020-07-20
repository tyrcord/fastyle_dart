import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/themes/dark/dark.theme.dart';
import 'package:fastyle_dart/themes/light/light.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastThemeFactory {
  static ThemeData buildLightThemeWithColors({
    @required Color primaryColor,
    Color secondaryColor,
    Color tertiaryColor,
    Color primaryColorDark,
  }) {
    return buildFastThemeWithColors(
      baseTheme: kLightFastTheme,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
    );
  }

  static ThemeData buildDarkThemeWithColors({
    @required Color primaryColor,
    Color secondaryColor,
    Color tertiaryColor,
    Color primaryColorDark,
  }) {
    return buildFastThemeWithColors(
      baseTheme: kDarkFastTheme,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
    );
  }

  static ThemeData buildFastThemeWithColors({
    @required ThemeData baseTheme,
    @required Color primaryColor,
    Color secondaryColor,
    Color tertiaryColor,
    Color primaryColorDark,
  }) {
    final textTheme = baseTheme.textTheme;
    final _primaryColorDark = primaryColorDark ?? baseTheme.primaryColorDark;
    final _secondaryColor = secondaryColor ?? baseTheme.accentColor;
    final _tertiaryColor = tertiaryColor ?? textTheme.overline.color;

    return baseTheme.copyWith(
      primaryColor: primaryColor,
      primaryColorDark: _primaryColorDark,
      accentColor: _secondaryColor,
      buttonColor: primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      textTheme: textTheme.copyWith(
        caption: textTheme.caption.copyWith(color: _secondaryColor),
        overline: textTheme.overline.copyWith(color: _tertiaryColor),
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
