import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const _kFontSize48 = 48.0;
const _kFontSize34 = 34.0;
const _kFontSize20 = 20.0;
const _kFontSize17 = 17.0;
const _kFontSize15 = 15.0;
const _kFontSize13 = 13.0;

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
    fontSize: _kFontSize17,
    fontWeight: FontWeight.w600,
  ),
  headline6: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize20,
    fontWeight: FontWeight.w400,
  ),
  subtitle2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize15,
    fontWeight: FontWeight.w600,
  ),
  bodyText1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize17,
    fontWeight: FontWeight.w400,
  ),
  bodyText2: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize15,
    fontWeight: FontWeight.w400,
  ),
  button: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize15,
    fontWeight: FontWeight.w600,
  ),
  caption: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize15,
    fontWeight: FontWeight.w300,
  ),
  overline: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize13,
    fontWeight: FontWeight.w300,
  ),
);
