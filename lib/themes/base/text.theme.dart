import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const _kFontSize48 = 48.0;
const _kFontSize34 = 34.0;
const _kFontSize24 = 24.0;
const _kFontSize18 = 18.0;
const _kFontSize16 = 16.0;
const _kFontSize14 = 14.0;

final kFastTextTheme = TextTheme(
  headline4: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize48,
    fontWeight: FontWeight.w400,
  ),
  headline5: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize34,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize18,
    fontWeight: FontWeight.w600,
  ),
  headline6: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize24,
    fontWeight: FontWeight.w500,
  ),
  subtitle2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w600,
  ),
  bodyText1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize18,
    fontWeight: FontWeight.w400,
  ),
  bodyText2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w400,
  ),
  button: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w600,
  ),
  caption: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize16,
    fontWeight: FontWeight.w400,
  ),
  overline: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize14,
    fontWeight: FontWeight.w400,
  ),
);
