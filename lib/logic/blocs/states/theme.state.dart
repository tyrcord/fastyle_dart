import 'package:flutter/material.dart';

import 'package:tbloc/tbloc.dart';

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
  FastThemeBlocState clone() => copyWith();

  @override
  FastThemeBlocState merge(covariant FastThemeBlocState model) {
    return copyWith(
      brightness: model.brightness,
      themeMode: model.themeMode,
    );
  }

  @override
  List<Object?> get props => [themeMode, brightness];
}
