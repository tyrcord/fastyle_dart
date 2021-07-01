import 'package:flutter/material.dart';

import 'package:tbloc_dart/tbloc_dart.dart';

class FastThemeBlocState extends BlocState {
  final Brightness? brightness;
  final ThemeMode themeMode;

  const FastThemeBlocState({
    this.themeMode = ThemeMode.system,
    this.brightness,
  }) : super();

  @override
  FastThemeBlocState copyWith({ThemeMode? themeMode, Brightness? brightness}) {
    return FastThemeBlocState(
      brightness: brightness ?? this.brightness,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  FastThemeBlocState clone() {
    return FastThemeBlocState(
      brightness: brightness,
      themeMode: themeMode,
    );
  }

  @override
  FastThemeBlocState merge(covariant FastThemeBlocState state) {
    return copyWith(
      brightness: state.brightness,
      themeMode: state.themeMode,
    );
  }

  @override
  List<Object?> get props => [themeMode, brightness];
}
