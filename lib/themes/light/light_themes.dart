import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/themes/theme.factory.dart';
import 'package:flutter/cupertino.dart';

final kLightBlueFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightBlueColor,
  primaryColorDark: CupertinoColors.systemBlue.highContrastColor,
  secondaryColor: kFastLightIndigoColor,
  tertiaryColor: kFastLightTealColor,
);

final kLightIndigoFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightIndigoColor,
  primaryColorDark: CupertinoColors.systemIndigo.highContrastColor,
  secondaryColor: kFastLightPurpleColor,
  tertiaryColor: kFastLightTealColor,
);

final kLightPinkFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightPinkColor,
  primaryColorDark: CupertinoColors.systemPink.highContrastColor,
  secondaryColor: kFastLightPurpleColor,
  tertiaryColor: kFastLightTealColor,
);

final kLightPurpleFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightPurpleColor,
  primaryColorDark: CupertinoColors.systemPurple.highContrastColor,
  secondaryColor: kFastLightIndigoColor,
  tertiaryColor: kFastLightTealColor,
);

final kLightTealFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightTealColor,
  primaryColorDark: CupertinoColors.systemTeal.highContrastColor,
  secondaryColor: kFastLightPurpleColor,
  tertiaryColor: kFastLightBlueColor,
);

final kLightYellowFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightYellowColor,
  primaryColorDark: CupertinoColors.systemYellow.highContrastColor,
  secondaryColor: kFastLightIndigoColor,
  tertiaryColor: kFastLightTealColor,
);

final kLightOrangeFastTheme = FastThemeFactory.buildLightThemeWithColors(
  primaryColor: kFastLightOrangeColor,
  primaryColorDark: CupertinoColors.systemOrange.highContrastColor,
  secondaryColor: kFastLightIndigoColor,
  tertiaryColor: kFastLightTealColor,
);
