import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const _kFontSize48 = 48.0;
const _kFontSize34 = 34.0;
const _kFontSize24 = 24.0;
const _kFontSize18 = 18.0;
const _kFontSize16 = 16.0;
const _kFontSize14 = 14.0;

const _kFontFamilyFallback = <String>[
  'San Francisco',
  'Helvetica Neue',
  'Helvetica',
  'Roboto',
  'Arial',
];

final kFastTextTheme = TextTheme(
  headline4: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize48,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline5: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize34,
    fontWeight: FontWeight.w700,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize18,
    fontWeight: FontWeight.w700,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  headline6: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize24,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  subtitle2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w700,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize18,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  bodyText2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  button: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w700,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  caption: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
  overline: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize14,
    fontWeight: FontWeight.w400,
  ).copyWith(fontFamilyFallback: _kFontFamilyFallback),
);
