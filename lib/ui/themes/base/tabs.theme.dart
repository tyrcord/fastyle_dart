import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

final kFastTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  labelStyle: kFastTextTheme.bodyText1,
  unselectedLabelStyle: kFastTextTheme.bodyText1!.copyWith(
    fontWeight: kFastFontWeightLight,
  ),
);
