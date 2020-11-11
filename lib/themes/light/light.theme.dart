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
    headline4: _baseTextTheme.headline4.copyWith(
      color: kFastLightlabelColor,
    ),
    headline5: _baseTextTheme.headline5.copyWith(
      color: kFastLightlabelColor,
    ),
    subtitle1: _baseTextTheme.subtitle1.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    headline6: _baseTextTheme.headline6.copyWith(
      color: kFastLightlabelColor,
    ),
    subtitle2: _baseTextTheme.subtitle2.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    bodyText1: _baseTextTheme.bodyText1.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    bodyText2: _baseTextTheme.bodyText2.copyWith(
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
  popupMenuTheme: PopupMenuThemeData(
    color: kFastLightSecondaryBackgroundColor,
  ),
);
