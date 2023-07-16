// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

final kFastTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  labelStyle: kFastTextTheme.bodyLarge,
  unselectedLabelStyle: kFastTextTheme.bodyLarge!.copyWith(
    fontWeight: kFastFontWeightLight,
  ),
);
