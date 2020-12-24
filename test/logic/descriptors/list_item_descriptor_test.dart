import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

void main() {
  group('FastListItemDescriptor', () {
    FastListItemDescriptor itemDescriptor;
    FastListItemDescriptor itemDescriptor2;
    Widget trailing = Text('trailing');
    Widget leading = Text('leading');

    setUp(() {
      itemDescriptor = FastListItemDescriptor();
      itemDescriptor2 = FastListItemDescriptor(
        leading: leading,
        trailing: trailing,
      );
    });

    group('#constructor()', () {
      test('isDense should be equal to true by default', () {
        expect(itemDescriptor.isDense, equals(true));

        itemDescriptor = FastListItemDescriptor(isDense: null);

        expect(itemDescriptor.isDense, equals(true));
      });

      test('leading should be equal to null by default', () {
        expect(itemDescriptor.leading, equals(null));
      });

      test('trailing should be equal to null by default', () {
        expect(itemDescriptor.trailing, equals(null));
      });
    });

    group('#copyWith()', () {
      test('should return a copy of a FastListItemDescriptor object', () {
        final copy = itemDescriptor2.copyWith(isDense: false);

        expect(copy.isDense, equals(false));
        expect(copy.trailing, equals(trailing));
        expect(copy.leading, equals(leading));
      });
    });

    group('#clone()', () {
      test('should return a copy of a FastListItemDescriptor object', () {
        final copy = itemDescriptor2.clone();

        expect(itemDescriptor2 == copy, equals(true));
        expect(copy.isDense, equals(true));
        expect(copy.trailing, equals(trailing));
        expect(copy.leading, equals(leading));
      });
    });
  });
}
