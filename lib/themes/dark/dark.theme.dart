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
    display1: _baseTextTheme.display1.copyWith(
      color: kFastDarklabelColor,
    ),
    headline: _baseTextTheme.headline.copyWith(
      color: kFastDarklabelColor,
    ),
    subhead: _baseTextTheme.subhead.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    title: _baseTextTheme.title.copyWith(
      color: kFastDarklabelColor,
    ),
    subtitle: _baseTextTheme.subtitle.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    body1: _baseTextTheme.body1.copyWith(
      color: kFastDarklabelColor,
    ),
    body2: _baseTextTheme.body2.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    button: _baseTextTheme.button.copyWith(
      color: kFastDarklabelColor,
    ),
    caption: _baseTextTheme.caption.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    overline: _baseTextTheme.overline.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: kFastDarklabelColor,
  ),
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
    hintStyle: TextStyle(
      color: kFastDarkHintLabelColor,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kFastDarkSeparatorColor,
        width: kFastBorderSize,
      ),
    ),
  ),
);
