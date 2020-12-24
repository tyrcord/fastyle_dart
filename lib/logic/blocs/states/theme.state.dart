import 'package:flutter/material.dart';

import 'package:tbloc_dart/tbloc_dart.dart';

class FastThemeBlocState extends BlocState {
  final ThemeMode themeMode;
  final Brightness brightness;

  const FastThemeBlocState({
    ThemeMode themeMode = ThemeMode.system,
    this.brightness,
  })  : themeMode = themeMode ?? ThemeMode.system,
        super();

  @override
  FastThemeBlocState copyWith({ThemeMode themeMode, Brightness brightness}) {
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
  FastThemeBlocState merge({@required FastThemeBlocState state}) {
    assert(state != null);

    return copyWith(
      brightness: state.brightness,
      themeMode: state.themeMode,
    );
  }

  @override
  List<Object> get props => [themeMode, brightness];
}
