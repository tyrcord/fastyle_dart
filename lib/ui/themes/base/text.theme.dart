import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kFastFontSize48 = 48.0;
const kFastFontSize34 = 34.0;
const kFastFontSize24 = 24.0;
const kFastFontSize18 = 18.0;
const kFastFontSize16 = 16.0;
const kFastFontSize14 = 14.0;
const kFastFontSize12 = 12.0;
const kFastFontSize10 = 10.0;

const kFastFontWeightLight = FontWeight.w300;
const kFastFontWeightRegular = FontWeight.w400;
const kFastFontWeightMedium = FontWeight.w500;
const kFastFontWeightSemiBold = FontWeight.w600;
const kFastFontWeightBold = FontWeight.w700;

const _kFontFamilyFallback = <String>[
  'San Francisco',
  'Helvetica Neue',
  'Helvetica',
  'Roboto',
  'Arial',
];

final kFastTextTheme = TextTheme(
  headline4: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize48,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline5: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightMedium,
    fontSize: kFastFontSize34,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline3: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightSemiBold,
    fontSize: kFastFontSize18,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline6: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize24,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle1: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightSemiBold,
    fontSize: kFastFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle2: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightMedium,
    fontSize: kFastFontSize14,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText1: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize18,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText2: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  button: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightMedium,
    fontSize: kFastFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  caption: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  overline: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: kFastFontSize14,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
);
