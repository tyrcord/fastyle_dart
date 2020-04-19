import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';

class FastThemeBloc
    extends BidirectionalBloc<FastThemeBlocEvent, FastThemeBlocState> {
  FastThemeBloc(FastThemeBlocState initialState)
      : super(initialState: initialState);

  @override
  Stream<FastThemeBlocState> mapEventToState(
    FastThemeBlocEvent event,
    FastThemeBlocState currentState,
  ) async* {
    if (event.payload == FastThemeBlocEventAction.light) {
      yield FastThemeBlocState(
        themeMode: ThemeMode.light,
        brightness: Brightness.light,
      );
    } else if (event.payload == FastThemeBlocEventAction.dark) {
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

class FastThemeBlocState extends BlocState {
  final ThemeMode themeMode;
  final Brightness brightness;

  const FastThemeBlocState({
    this.themeMode = ThemeMode.system,
    this.brightness,
  }) : super();

  @override
  List<Object> get props => [themeMode];
}

enum FastThemeBlocEventAction {
  light,
  dark,
  system,
}

class FastThemeBlocEvent extends BlocEvent<FastThemeBlocEventAction> {
  const FastThemeBlocEvent({
    @required FastThemeBlocEventAction action,
  }) : super(payload: action);

  FastThemeBlocEvent.dart() : this(action: FastThemeBlocEventAction.dark);

  FastThemeBlocEvent.light() : this(action: FastThemeBlocEventAction.light);

  FastThemeBlocEvent.system() : this(action: FastThemeBlocEventAction.system);
}
