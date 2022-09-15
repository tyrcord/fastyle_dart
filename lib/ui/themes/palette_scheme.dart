import 'package:flutter/material.dart';

class FastPaletteScheme {
  final Color lightest;
  final Color lighter;
  final Color light;
  final Color mid;
  final Color dark;
  final Color darker;
  final Color darkest;

  const FastPaletteScheme._internal({
    required this.lightest,
    required this.lighter,
    required this.light,
    required this.mid,
    required this.dark,
    required this.darker,
    required this.darkest,
  });

  factory FastPaletteScheme.fromColor(Color color) {
    final base = HSLColor.fromColor(color);

    return FastPaletteScheme._internal(
      lightest: base.withLightness(0.84).toColor(),
      lighter: base.withLightness(0.73).toColor(),
      light: base.withLightness(0.62).toColor(),
      mid: base.withLightness(0.51).toColor(),
      dark: base.withLightness(0.42).toColor(),
      darker: base.withLightness(0.33).toColor(),
      darkest: base.withLightness(0.24).toColor(),
    );
  }
}
