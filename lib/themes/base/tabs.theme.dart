import 'package:fastyle_dart/themes/base/base.dart';
import 'package:flutter/material.dart';

final kFastTabBarTheme = TabBarTheme(
  indicatorSize: TabBarIndicatorSize.label,
  labelStyle: kFastTextTheme.bodyText1,
  unselectedLabelStyle: kFastTextTheme.bodyText1.copyWith(
    fontWeight: FontWeight.w300,
  ),
);
