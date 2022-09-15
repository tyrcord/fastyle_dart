import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _baseTextTheme = kBaseFastTheme.textTheme;
final _baseTabBarTheme = kBaseFastTheme.tabBarTheme;

final kDarkFastTheme = kBaseFastTheme.copyWith(
  scaffoldBackgroundColor: kFastDarkPrimaryBackgroundColor,
  backgroundColor: kFastDarkSecondaryBackgroundColor,
  dialogBackgroundColor: kFastDarkTertiaryBackgroundColor,
  hintColor: kFastDarkHintLabelColor,
  textTheme: _baseTextTheme.copyWith(
    headline4: _baseTextTheme.headline4!.copyWith(
      color: kFastDarklabelColor,
    ),
    headline5: _baseTextTheme.headline5!.copyWith(
      color: kFastDarklabelColor,
    ),
    subtitle1: _baseTextTheme.subtitle1!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    headline6: _baseTextTheme.headline6!.copyWith(
      color: kFastDarklabelColor,
    ),
    subtitle2: _baseTextTheme.subtitle2!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    bodyText1: _baseTextTheme.bodyText1!.copyWith(
      color: kFastDarklabelColor,
    ),
    bodyText2: _baseTextTheme.bodyText2!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    button: _baseTextTheme.button!.copyWith(
      color: kFastDarklabelColor,
    ),
    caption: _baseTextTheme.caption!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    overline: _baseTextTheme.overline!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
  ),
  iconTheme: IconThemeData(color: kFastDarklabelColor),
  tabBarTheme: _baseTabBarTheme.copyWith(
    labelColor: kFastDarklabelColor,
    unselectedLabelColor: kFastDarkSecondaryLabelColor,
  ),
  cardTheme: CardTheme(
    color: kFastDarkSecondaryBackgroundColor,
  ),
  dividerColor: kFastDarkSeparatorColor,
  dividerTheme: DividerThemeData(
    color: kFastDarkSeparatorColor,
    thickness: kFastDividerSize,
    indent: kFastDividerIndent,
  ),
  inputDecorationTheme: kInputDecorationTheme.copyWith(
    hintStyle: TextStyle(color: kFastDarkHintLabelColor),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kFastDarkSeparatorColor,
        width: kFastBorderSize,
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: kFastDarkTertiaryBackgroundColor,
  ),
);
