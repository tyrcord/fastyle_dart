// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

class ThemeGradientHelper {
  LinearGradient primaryLinearGradient(BuildContext context) {
    final theme = Theme.of(context);

    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        theme.primaryColor,
        ThemeHelper.colors.getSecondaryColor(context),
      ],
    );
  }

  SystemUiOverlayStyle getSystemUiOverlayStyleForGradient({
    required BuildContext context,
    required LinearGradient gradient,
  }) {
    final luminances = gradient.colors.map(
      (Color color) => color.computeLuminance(),
    );

    final averageLuminance =
        luminances.reduce((a, b) => a + b) / luminances.length;

    return averageLuminance > 0.5
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
  }
}
