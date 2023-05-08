import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

final kFastTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  labelStyle: kFastTextTheme.bodyLarge,
  unselectedLabelStyle: kFastTextTheme.bodyLarge!.copyWith(
    fontWeight: kFastFontWeightLight,
  ),
);
