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
      return this.shouldAcceptDecimalValue
          ? TextEditingValue(
              text: NumberFormat(
              '0.',
              defaultLocale,
            ).format(0))
          : oldValue;
    }

    if (!this._isValidNumber(
      newValueText,
      decimalSeparator: defaultDecimalSeparator,
    )) {
      return oldValue;
    }

    final dotRegExp = RegExp("\\$defaultDecimalSeparator");
    final decimalMatches = dotRegExp.allMatches(newValueText);

    if (decimalMatches.length > 1) {
      return oldValue;
    }

    final int decimalSeparatorPosition =
        newValueText.indexOf(defaultDecimalSeparator);
    int newValueTextLength = newValue.text.length;

    if (decimalSeparatorPosition > -1 &&
        decimalSeparatorPosition < this.maxLength) {
      --newValueTextLength;
    }

    if (newValueTextLength > this.maxLength) {
      return oldValue;
    }

    num number;

    try {
      number = defaultNumberFormat.parse(newValueText);
    } catch (e) {}

    if (number != null) {
      if (number > this.maxValue) {
        return oldValue;
      }

      String checkedNewValueText;

      if (this.shouldAcceptDecimalValue && decimalMatches.length > 0) {
        int fractionDigits = newValueText.length - decimalSeparatorPosition - 1;

        if (fractionDigits > 0) {
          // decimal number
          fractionDigits = fractionDigits > 20 ? 20 : fractionDigits;
          checkedNewValueText = this._localizeNumber(
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
    final regExp = this.shouldAcceptDecimalValue
        ? RegExp("^\\d*(\\$decimalSeparator?\\d*)?\$")
        : RegExp(r'^\d*$');

    return regExp.hasMatch(number);
  }

  String _localizeNumber(String value, {String decimalSeparator = '.'}) {
    if (decimalSeparator != defaultDecimalSeparator) {
      List<String> stringMedata = value.split(defaultDecimalSeparator);

      if (stringMedata.length > 1) {
        String pattern = '';

        for (int i = 0; i < stringMedata[0].length; i++) {
          pattern += '0';
        }

        pattern += defaultDecimalSeparator;

        for (int i = 0; i < stringMedata[1].length; i++) {
          pattern += '0';
        }

        NumberFormat numberFormatter = NumberFormat(pattern, defaultLocale);
        return numberFormatter.format(double.tryParse(value));
      }
    }

    return value;
  }
}
