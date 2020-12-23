import 'package:diacritic/diacritic.dart';

///
/// Removes any diacritics from text and lowercase it.
///
String normalizeTextByRemovingDiacritics(String text) {
  return removeDiacritics(text.toLowerCase());
}
