import 'package:test/test.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

void main() {
  group('#normalizeTextByRemovingDiacritics()', () {
    test('should lowercase any given text', () {
      expect(normalizeTextByRemovingDiacritics('LOWERCASE'), 'lowercase');
    });

    test('should remove any diacritics from any given text', () {
      expect(normalizeTextByRemovingDiacritics('brûlée'), 'brulee');
    });

    test('should lowercase and remove any diacritics from any given text', () {
      expect(normalizeTextByRemovingDiacritics('Brûlée'), 'brulee');
    });
  });
}
