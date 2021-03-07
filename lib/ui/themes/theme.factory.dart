import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastThemeFactory {
  static ThemeData buildLightThemeWithColors({
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? primaryColorDark,
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
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? primaryColorDark,
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
    required ThemeData baseTheme,
    required Color primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? primaryColorDark,
  }) {
    final textTheme = baseTheme.textTheme;
    final _secondaryColor = secondaryColor ?? baseTheme.accentColor;
    final _tertiaryColor = tertiaryColor ?? textTheme.overline!.color;

    return baseTheme.copyWith(
      inputDecorationTheme: _buildInputDecorationTheme(baseTheme, primaryColor),
      primaryColorDark: primaryColorDark ?? baseTheme.primaryColorDark,
      buttonTheme: _buildButtonThemeData(primaryColor),
      accentColor: _secondaryColor,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      textTheme: textTheme.copyWith(
        caption: textTheme.caption!.copyWith(color: _secondaryColor),
        overline: textTheme.overline!.copyWith(color: _tertiaryColor),
      ),
    );
  }

  static ButtonThemeData _buildButtonThemeData(Color color) {
    return ButtonThemeData(
      disabledColor: color.withAlpha(155),
      buttonColor: color,
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(
    ThemeData themeData,
    Color color,
  ) {
    return themeData.inputDecorationTheme.copyWith(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: kFastBorderSize),
      ),
    );
  }
}
