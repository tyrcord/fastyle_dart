import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/themes/theme.factory.dart';
import 'package:flutter/cupertino.dart';

final kDarkBlueFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkBlueColor,
  primaryColorDark: CupertinoColors.systemBlue.darkHighContrastColor,
  secondaryColor: kFastDarkIndigoColor,
  tertiaryColor: kFastDarkTealColor,
);

final kDarkIndigoFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkIndigoColor,
  primaryColorDark: CupertinoColors.systemIndigo.darkHighContrastColor,
  secondaryColor: kFastDarkPurpleColor,
  tertiaryColor: kFastDarkTealColor,
);

final kDarkPinkFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkPinkColor,
  primaryColorDark: CupertinoColors.systemPink.darkHighContrastColor,
  secondaryColor: kFastDarkPurpleColor,
  tertiaryColor: kFastDarkTealColor,
);

final kDarkPurpleFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkPurpleColor,
  primaryColorDark: CupertinoColors.systemPurple.darkHighContrastColor,
  secondaryColor: kFastDarkIndigoColor,
  tertiaryColor: kFastDarkTealColor,
);

final kDarkTealFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkTealColor,
  primaryColorDark: CupertinoColors.systemTeal.darkHighContrastColor,
  secondaryColor: kFastDarkPurpleColor,
  tertiaryColor: kFastDarkBlueColor,
);

final kDarkYellowFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkYellowColor,
  primaryColorDark: CupertinoColors.systemYellow.darkHighContrastColor,
  secondaryColor: kFastDarkIndigoColor,
  tertiaryColor: kFastDarkTealColor,
);

final kDarkOrangeFastTheme = FastThemeFactory.buildDarkThemeWithColors(
  primaryColor: kFastDarkOrangeColor,
  primaryColorDark: CupertinoColors.systemOrange.darkHighContrastColor,
  secondaryColor: kFastDarkIndigoColor,
  tertiaryColor: kFastDarkTealColor,
);
