import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class FastThemeBloc
    extends BidirectionalBloc<FastThemeBlocEvent, FastThemeBlocState> {
  FastThemeBloc({
    FastThemeBlocState initialState,
  }) : super(initialState: initialState ?? FastThemeBlocState());

  @override
  Stream<FastThemeBlocState> mapEventToState(FastThemeBlocEvent event) async* {
    if (event.type == FastThemeBlocEventType.light) {
      yield FastThemeBlocState(
        themeMode: ThemeMode.light,
        brightness: Brightness.light,
      );
    } else if (event.type == FastThemeBlocEventType.dark) {
      yield FastThemeBlocState(
        themeMode: ThemeMode.dark,
        brightness: Brightness.dark,
      );
    } else {
      yield FastThemeBlocState(
        themeMode: ThemeMode.system,
        brightness: WidgetsBinding.instance.window.platformBrightness,
      );
    }
  }
}
