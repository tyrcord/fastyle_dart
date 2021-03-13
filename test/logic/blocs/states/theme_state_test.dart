import 'package:flutter/material.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:test/test.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

void main() {
  group('FastThemeBlocState', () {
    late FastThemeBlocState state1;
    late FastThemeBlocState state2;

    setUp(() {
      state1 = FastThemeBlocState();

      state2 = FastThemeBlocState(
        themeMode: ThemeMode.light,
        brightness: Brightness.light,
      );
    });

    group('#constructor()', () {
      test('should be an instance of BlocState', () {
        expect(state1, isA<BlocState>());
      });

      test('ThemeMode should be equal to ThemeMode.system by default', () {
        expect(state1.themeMode, equals(ThemeMode.system));
      });

      test('brightness should be equal to null by default', () {
        expect(state1.brightness, equals(null));
      });
    });

    group('#copyWith()', () {
      test(
          'should return a copy of a FastThemeBlocState object '
          'according to the given parameters', () {
        var copy = state1.copyWith(themeMode: ThemeMode.dark);

        expect(copy.themeMode, equals(ThemeMode.dark));
        expect(copy.brightness, equals(null));

        copy = state1.copyWith(
          themeMode: ThemeMode.dark,
          brightness: Brightness.dark,
        );

        expect(copy.themeMode, equals(ThemeMode.dark));
        expect(copy.brightness, equals(Brightness.dark));
      });
    });

    group('#clone()', () {
      test('should return a copy of a FastThemeBlocState object', () {
        final copy = state2.clone();

        expect(copy.themeMode, equals(ThemeMode.light));
        expect(copy.brightness, equals(Brightness.light));
      });
    });

    group('#merge()', () {
      test('should combine two FastThemeBlocState objects', () {
        final state = FastThemeBlocState(
          themeMode: ThemeMode.dark,
        );

        final merged = state2.merge(state: state);

        expect(merged.themeMode, equals(ThemeMode.dark));
        expect(merged.brightness, equals(Brightness.light));
      });
    });

    group('#operator ==', () {
      test(
          'should return true '
          'when two FastThemeBlocState objects are equal ', () {
        state1 = FastThemeBlocState(
          themeMode: ThemeMode.light,
          brightness: Brightness.light,
        );

        state2 = FastThemeBlocState(
          themeMode: ThemeMode.light,
          brightness: Brightness.light,
        );
        expect(state1 == state2, equals(true));
      });

      test(
          'should return false '
          'when two FastThemeBlocState objects are unequal ', () {
        state1 = FastThemeBlocState(
          themeMode: ThemeMode.light,
          brightness: Brightness.light,
        );

        state2 = FastThemeBlocState(
          themeMode: ThemeMode.dark,
          brightness: Brightness.light,
        );

        expect(state1 == state2, equals(false));
      });
    });
  });
}
