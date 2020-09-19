import 'package:flutter/material.dart';

import 'package:tbloc_dart/tbloc_dart.dart';

class FastThemeBlocState extends BlocState {
  final ThemeMode themeMode;
  final Brightness brightness;

  const FastThemeBlocState({
    ThemeMode themeMode = ThemeMode.system,
    this.brightness,
  })  : this.themeMode = themeMode ?? ThemeMode.system,
        super();

  copyWith({ThemeMode themeMode, Brightness brightness}) {
    return FastThemeBlocState(
      themeMode: themeMode ?? this.themeMode,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  List<Object> get props => [themeMode, brightness];
}
