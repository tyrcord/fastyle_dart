import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

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
}
