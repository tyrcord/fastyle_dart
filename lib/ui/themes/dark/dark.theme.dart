import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _baseTextTheme = kBaseFastTheme.textTheme;
final _baseTabBarTheme = kBaseFastTheme.tabBarTheme;

final kDarkFastTheme = kBaseFastTheme.copyWith(
  scaffoldBackgroundColor: kFastDarkPrimaryBackgroundColor,
  backgroundColor: kFastDarkSecondaryBackgroundColor,
  dialogBackgroundColor: kFastDarkTertiaryBackgroundColor,
  hintColor: kFastDarkHintLabelColor,
  textTheme: _baseTextTheme.copyWith(
    headline4: _baseTextTheme.headline4!.copyWith(
      color: kFastDarkLabelColor,
    ),
    headline5: _baseTextTheme.headline5!.copyWith(
      color: kFastDarkLabelColor,
    ),
    headline3: _baseTextTheme.subtitle1!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    headline6: _baseTextTheme.headline6!.copyWith(
      color: kFastDarkLabelColor,
    ),
    subtitle1: _baseTextTheme.subtitle1!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    subtitle2: _baseTextTheme.subtitle1!.copyWith(
      color: kFastDarkTertiaryLabelColor,
    ),
    bodyText1: _baseTextTheme.bodyText1!.copyWith(
      color: kFastDarkLabelColor,
    ),
    bodyText2: _baseTextTheme.bodyText2!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    button: _baseTextTheme.button!.copyWith(
      color: kFastDarkLabelColor,
    ),
    caption: _baseTextTheme.caption!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
    overline: _baseTextTheme.overline!.copyWith(
      color: kFastDarkSecondaryLabelColor,
    ),
  ),
  iconTheme: IconThemeData(color: kFastDarkLabelColor),
  tabBarTheme: _baseTabBarTheme.copyWith(
    labelColor: kFastDarkLabelColor,
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
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      const interactiveStates = <MaterialState>{
        MaterialState.hovered,
        MaterialState.dragged,
      };

      if (states.any(interactiveStates.contains)) {
        return kFastDarkGrayPaletteColors.lighter;
      }

      return kFastDarkGrayPaletteColors.light;
    }),
  ),
  shadowColor: kFastDarkShadowColor,
  navigationBarTheme: kFastNavigationBarTheme.copyWith(
    surfaceTintColor: kFastDarkSecondaryBackgroundColor,
    iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(MaterialState.disabled)) {
        return IconThemeData(color: kFastDarkTertiaryLabelColor);
      } else if (states.contains(MaterialState.selected)) {
        return IconThemeData(color: kFastDarkWhiteColor);
      }

      return IconThemeData(color: kFastDarkLabelColor);
    }),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (
        Set<MaterialState> states,
      ) {
        var base = GoogleFonts.barlowSemiCondensed(
          fontWeight: kFastFontWeightRegular,
          fontSize: kFastFontSize16,
          color: kFastLightLabelColor,
        );

        if (states.contains(MaterialState.disabled)) {
          return base.copyWith(color: kFastDarkTertiaryLabelColor);
        }

        return base.copyWith(color: kFastDarkLabelColor);
      },
    ),
  ),
);
