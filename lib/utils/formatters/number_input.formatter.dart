import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final bool shouldAcceptDecimalValue;
  final int maxLength;
  final int maxValue;

  static const int safeInteger = 9007199254740992; // 2^53
  static const int safeMaxLength = 16;
  static const String defaultLocale = 'en_US';
  static const String defaultDecimalSeparator = '.';

  NumberInputFormatter({
    this.maxLength = NumberInputFormatter.safeMaxLength,
    this.shouldAcceptDecimalValue = true,
    this.maxValue = NumberInputFormatter.safeInteger,
  })  : assert(maxValue <= NumberInputFormatter.safeInteger),
        assert(maxLength <= NumberInputFormatter.safeMaxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newValueText = newValue.text;

    if (newValueText == '' || newValueText == null) {
      return newValue;
    }

    // workaround for locale decimal separator
    final defaultNumberFormat = NumberFormat.decimalPattern(defaultLocale);

    if (newValueText.contains(',')) {
      newValueText = newValueText.replaceFirst(RegExp(','), '.');
    }

    if (newValueText == defaultDecimalSeparator) {
      return shouldAcceptDecimalValue
          ? TextEditingValue(
              text: NumberFormat(
              '0.',
              defaultLocale,
            ).format(0))
          : oldValue;
    }

    if (!_isValidNumber(
      newValueText,
      decimalSeparator: defaultDecimalSeparator,
    )) {
      return oldValue;
    }

    final dotRegExp = RegExp('\\$defaultDecimalSeparator');
    final decimalMatches = dotRegExp.allMatches(newValueText);

    if (decimalMatches.length > 1) {
      return oldValue;
    }

    final decimalSeparatorPosition =
        newValueText.indexOf(defaultDecimalSeparator);
    var newValueTextLength = newValue.text.length;

    if (decimalSeparatorPosition > -1 && decimalSeparatorPosition < maxLength) {
      --newValueTextLength;
    }

    if (newValueTextLength > maxLength) {
      return oldValue;
    }

    num number;

    try {
      number = defaultNumberFormat.parse(newValueText);
      // ignore: empty_catches
    } catch (e) {}

    if (number != null) {
      if (number > maxValue) {
        return oldValue;
      }

      String checkedNewValueText;

      if (shouldAcceptDecimalValue && decimalMatches.isNotEmpty) {
        var fractionDigits = newValueText.length - decimalSeparatorPosition - 1;

        if (fractionDigits > 0) {
          // decimal number
          fractionDigits = fractionDigits > 20 ? 20 : fractionDigits;
          checkedNewValueText = _localizeNumber(
            number.toStringAsFixed(fractionDigits),
            decimalSeparator: defaultDecimalSeparator,
          );
        } else {
          // close to a decimal number (\d+.) => 0.
          checkedNewValueText = newValueText;
        }
      } else {
        // integer
        checkedNewValueText = number.toStringAsFixed(0);
      }

      return TextEditingValue(
        text: checkedNewValueText ?? '',
        selection: newValue.selection,
      );
    }

    return oldValue;
  }

  bool _isValidNumber(String number, {String decimalSeparator = '.'}) {
    final regExp = shouldAcceptDecimalValue
        ? RegExp('^\\d*(\\$decimalSeparator?\\d*)?\$')
        : RegExp(r'^\d*$');

    return regExp.hasMatch(number);
  }

  String _localizeNumber(String value, {String decimalSeparator = '.'}) {
    if (decimalSeparator != defaultDecimalSeparator) {
      final stringMedata = value.split(defaultDecimalSeparator);

      if (stringMedata.length > 1) {
        var pattern = '';

        for (var i = 0; i < stringMedata[0].length; i++) {
          pattern += '0';
        }

        pattern += defaultDecimalSeparator;

        for (var i = 0; i < stringMedata[1].length; i++) {
          pattern += '0';
        }

        final numberFormatter = NumberFormat(pattern, defaultLocale);
        return numberFormatter.format(double.tryParse(value));
      }
    }

    return value;
  }
}
