import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _kFontSize48 = 48.0;
const _kFontSize34 = 34.0;
const _kFontSize24 = 24.0;
const _kFontSize18 = 18.0;
const _kFontSize16 = 16.0;
const _kFontSize14 = 14.0;

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
    fontSize: _kFontSize48,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline5: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightMedium,
    fontSize: _kFontSize34,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle1: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightSemiBold,
    fontSize: _kFontSize18,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline6: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: _kFontSize24,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle2: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightSemiBold,
    fontSize: _kFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText1: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: _kFontSize18,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText2: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: _kFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  button: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightMedium,
    fontSize: _kFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  caption: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: _kFontSize16,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  overline: GoogleFonts.barlowSemiCondensed(
    fontWeight: kFastFontWeightRegular,
    fontSize: _kFontSize14,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
);
