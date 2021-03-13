import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class FastThemeBloc
    extends BidirectionalBloc<FastThemeBlocEvent, FastThemeBlocState> {
  FastThemeBloc({
    FastThemeBlocState? initialState,
  })  : assert((initialState != null && initialState.brightness != null) ||
            initialState == null),
        super(initialState: initialState ?? FastThemeBlocState()) {
    WidgetsBinding.instance!.window.onPlatformBrightnessChanged =
        onPlatformBrightnessChanged;
  }

  @override
  Stream<FastThemeBlocState> mapEventToState(FastThemeBlocEvent event) async* {
    if (event.type == FastThemeBlocEventType.light) {
      yield FastThemeBlocState(
        brightness: Brightness.light,
        themeMode: ThemeMode.light,
      );
    } else if (event.type == FastThemeBlocEventType.dark) {
      yield FastThemeBlocState(
        brightness: Brightness.dark,
        themeMode: ThemeMode.dark,
      );
    } else {
      yield FastThemeBlocState(
        brightness: WidgetsBinding.instance!.window.platformBrightness,
        themeMode: ThemeMode.system,
      );
    }
  }

  @protected
  void onPlatformBrightnessChanged() {
    final newBrightness = WidgetsBinding.instance!.window.platformBrightness;
    final brightness = currentState.brightness;
    final themeMode = currentState.themeMode;

    if (themeMode == ThemeMode.system && newBrightness != brightness) {
      addEvent(FastThemeBlocEvent.system());
    }
  }
}
