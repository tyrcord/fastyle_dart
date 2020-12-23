import 'package:diacritic/diacritic.dart';

String normalizeText(String text) => removeDiacritics(text.toLowerCase());
