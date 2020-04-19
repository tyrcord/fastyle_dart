import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const _kFontSize34 = 34.0;
const _kFontSize28 = 28.0;
const _kFontSize20 = 20.0;
const _kFontSize17 = 17.0;
const _kFontSize15 = 15.0;
const _kFontSize13 = 13.0;

final kFastTextTheme = TextTheme(
  display1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize34,
    fontWeight: FontWeight.w400,
  ),
  headline: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize28,
    fontWeight: FontWeight.w600,
  ),
  subhead: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize17,
    fontWeight: FontWeight.w600,
  ),
  title: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize20,
    fontWeight: FontWeight.w400,
  ),
  subtitle: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize15,
    fontWeight: FontWeight.w600,
  ),
  body1: GoogleFonts.robotoCondensed(
    fontSize: _kFontSize17,
    fontWeight: FontWeight.w400,
  ),
  body2: GoogleFonts.robotoCondensed(
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
