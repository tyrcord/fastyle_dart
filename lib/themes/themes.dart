import 'package:fastyle_dart/themes/theme_scheme.dart';
import 'package:fastyle_dart/themes/light/light.dart';
import 'package:fastyle_dart/themes/dark/dark.dart';

export 'package:fastyle_dart/themes/base/base.dart';
export 'package:fastyle_dart/themes/helpers/helpers.dart';
export 'package:fastyle_dart/themes/theme_scheme.dart';
export 'package:fastyle_dart/themes/light/light.dart';
export 'package:fastyle_dart/themes/dark/dark.dart';
export './theme.factory.dart';

class FastTheme {
  static FastThemeScheme dark = FastThemeScheme(
    blue: kDarkBlueFastTheme,
    orange: kDarkOrangeFastTheme,
    indigo: kDarkIndigoFastTheme,
    pink: kDarkPinkFastTheme,
    purple: kDarkPurpleFastTheme,
    teal: kDarkTealFastTheme,
    yellow: kDarkYellowFastTheme,
  );

  static FastThemeScheme light = FastThemeScheme(
    blue: kLightBlueFastTheme,
    orange: kLightOrangeFastTheme,
    indigo: kLightIndigoFastTheme,
    pink: kLightPinkFastTheme,
    purple: kLightPurpleFastTheme,
    teal: kLightTealFastTheme,
    yellow: kLightYellowFastTheme,
  );
}
