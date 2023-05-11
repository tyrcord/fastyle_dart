import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc/tbloc.dart';

class FastThemeBloc
    extends BidirectionalBloc<FastThemeBlocEvent, FastThemeBlocState> {
  FastThemeBloc({
    FastThemeBlocState? initialState,
  })  : assert((initialState != null && initialState.brightness != null) ||
            initialState == null),
        super(initialState: initialState ?? const FastThemeBlocState()) {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        onPlatformBrightnessChanged;
  }

  @override
  Stream<FastThemeBlocState> mapEventToState(FastThemeBlocEvent event) async* {
    if (event.type == FastThemeBlocEventType.light) {
      yield const FastThemeBlocState(
        brightness: Brightness.light,
        themeMode: ThemeMode.light,
      );
    } else if (event.type == FastThemeBlocEventType.dark) {
      yield const FastThemeBlocState(
        brightness: Brightness.dark,
        themeMode: ThemeMode.dark,
      );
    } else {
      yield FastThemeBlocState(
        brightness:
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
        themeMode: ThemeMode.system,
      );
    }
  }

  @protected
  void onPlatformBrightnessChanged() {
    final newBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final brightness = currentState.brightness;
    final themeMode = currentState.themeMode;

    if (themeMode == ThemeMode.system && newBrightness != brightness) {
      addEvent(const FastThemeBlocEvent.system());
    }
  }
}
