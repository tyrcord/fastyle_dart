import 'package:flutter/material.dart';

class ThemeGradientHelper {
  LinearGradient primaryLinearGradient(BuildContext context) {
    final theme = Theme.of(context);

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        theme.primaryColor,
        theme.primaryColorDark,
      ],
    );
  }
}
