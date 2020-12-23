import 'package:diacritic/diacritic.dart';

String normalizeTextByRemovingDiacritics(String text) {
  return removeDiacritics(text.toLowerCase());
}
