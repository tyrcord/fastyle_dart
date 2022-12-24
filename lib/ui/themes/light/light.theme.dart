import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _baseTextTheme = kBaseFastTheme.textTheme;
final _baseTabBarTheme = kBaseFastTheme.tabBarTheme;

final kLightFastTheme = kBaseFastTheme.copyWith(
  scaffoldBackgroundColor: kFastLightPrimaryBackgroundColor,
  backgroundColor: kFastLightSecondaryBackgroundColor,
  dialogBackgroundColor: kFastLightSecondaryBackgroundColor,
  hintColor: kFastLightHintLabelColor,
  textTheme: _baseTextTheme.copyWith(
    headline4: _baseTextTheme.headline4!.copyWith(
      color: kFastLightLabelColor,
    ),
    headline5: _baseTextTheme.headline5!.copyWith(
      color: kFastLightLabelColor,
    ),
    headline3: _baseTextTheme.subtitle1!.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    headline6: _baseTextTheme.headline6!.copyWith(
      color: kFastLightLabelColor,
    ),
    subtitle1: _baseTextTheme.subtitle1!.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    subtitle2: _baseTextTheme.subtitle2!.copyWith(
      color: kFastLightTertiaryLabelColor,
    ),
    bodyText1: _baseTextTheme.bodyText1!.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    bodyText2: _baseTextTheme.bodyText2!.copyWith(
      color: kFastLightTertiaryLabelColor,
    ),
    button: _baseTextTheme.button!.copyWith(
      color: kFastLightLabelColor,
    ),
    caption: _baseTextTheme.caption!.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
    overline: _baseTextTheme.overline!.copyWith(
      color: kFastLightSecondaryLabelColor,
    ),
  ),
  cardTheme: CardTheme(color: kFastLightSecondaryBackgroundColor),
  iconTheme: IconThemeData(color: kFastLightLabelColor),
  tabBarTheme: _baseTabBarTheme.copyWith(
    labelColor: kFastLightLabelColor,
    unselectedLabelColor: kFastLightSecondaryLabelColor,
  ),
  dividerColor: kFastLightSeparatorColor,
  dividerTheme: DividerThemeData(
    color: kFastLightSeparatorColor,
    thickness: kFastDividerSize,
    indent: kFastDividerIndent,
  ),
  inputDecorationTheme: kInputDecorationTheme.copyWith(
    hintStyle: TextStyle(color: kFastLightHintLabelColor),
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
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.resolveWith((states) {
      const interactiveStates = <MaterialState>{
        MaterialState.hovered,
        MaterialState.dragged,
      };

      if (states.any(interactiveStates.contains)) {
        return kFastLightGrayPaletteColors.mid;
      }

      return kFastLightGrayPaletteColors.light;
    }),
  ),
  shadowColor: kFastLightShadowColor,
  navigationBarTheme: kFastNavigationBarTheme.copyWith(
    surfaceTintColor: kFastLightWhiteColor,
    iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
      if (states.contains(MaterialState.disabled)) {
        return IconThemeData(color: kFastLightTertiaryLabelColor);
      } else if (states.contains(MaterialState.selected)) {
        return IconThemeData(color: kFastLightWhiteColor);
      }

      return IconThemeData(color: kFastLightLabelColor);
    }),
    labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (
        Set<MaterialState> states,
      ) {
        var base = GoogleFonts.barlowSemiCondensed(
          fontWeight: kFastFontWeightRegular,
          fontSize: kFastFontSize16,
        );

        if (states.contains(MaterialState.disabled)) {
          return base.copyWith(color: kFastLightTertiaryLabelColor);
        }

        return base.copyWith(color: kFastLightLabelColor);
      },
    ),
  ),
);
