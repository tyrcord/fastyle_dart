import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _baseTextTheme = kBaseFastTheme.textTheme;
final _baseTabBarTheme = kBaseFastTheme.tabBarTheme;

final kLightFastTheme = kBaseFastTheme.copyWith(
  scaffoldBackgroundColor: kFastLightPrimaryBackgroundColor,
  backgroundColor: kFastLightSecondaryBackgroundColor,
  dialogBackgroundColor: kFastLightSecondaryBackgroundColor,
  hintColor: kFastLightHintLabelColor,
  textTheme: _baseTextTheme.copyWith(
    display1: _baseTextTheme.display1.copyWith(
      color: kFastLightlabelColor,
    ),
    headline: _baseTextTheme.headline.copyWith(
      color: kFastLightlabelColor,
    ),
    subhead: _baseTextTheme.subhead.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    title: _baseTextTheme.title.copyWith(
      color: kFastLightlabelColor,
    ),
    subtitle: _baseTextTheme.subtitle.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    body1: _baseTextTheme.body1.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    body2: _baseTextTheme.body2.copyWith(
      color: kFastLightTertiaryLabelColor,
    ),
    button: _baseTextTheme.button.copyWith(
      color: kFastLightlabelColor,
    ),
    caption: _baseTextTheme.caption.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    overline: _baseTextTheme.overline.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: kFastLightlabelColor,
  ),
  tabBarTheme: _baseTabBarTheme.copyWith(
    labelColor: kFastLightlabelColor,
    unselectedLabelColor: kFastLightSecondaryLabelColor,
  ),
  cardTheme: CardTheme(
    color: kFastLightSecondaryBackgroundColor,
  ),
  dividerColor: kFastLightSeparatorColor,
  dividerTheme: DividerThemeData(
    color: kFastLightSeparatorColor,
    thickness: kFastDividerSize,
    indent: kFastDividerIndent,
  ),
  inputDecorationTheme: kInputDecorationTheme.copyWith(
    hintStyle: TextStyle(
      color: kFastLightHintLabelColor,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kFastLightSeparatorColor,
        width: kFastBorderSize,
      ),
    ),
  ),
);
