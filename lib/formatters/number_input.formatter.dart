import 'package:flutter/services.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/intl.dart';

class NumberInputFormatter extends TextInputFormatter {
  final bool shouldAcceptDecimalValue;
  final int maxLength;
  final int maxValue;
  final String locale;

  static const int safeInteger = 9007199254740992; // 2^53
  static const int safeMaxLength = 16;
  static const String defaultLocale = 'en_US';

  NumberInputFormatter({
    this.maxLength = NumberInputFormatter.safeMaxLength,
    this.shouldAcceptDecimalValue = true,
    this.maxValue = NumberInputFormatter.safeInteger,
    this.locale = NumberInputFormatter.defaultLocale,
  })  : assert(maxValue <= NumberInputFormatter.safeInteger),
        assert(maxLength <= NumberInputFormatter.safeMaxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newValueText = newValue.text;

    if (newValueText == '' || newValueText == null) {
      return newValue;
    }

    NumberFormat numberFormat = NumberFormat.decimalPattern(this.locale);
    NumberSymbols numberSymbols = numberFormat.symbols;

    if (newValueText == numberSymbols.DECIMAL_SEP) {
      return this.shouldAcceptDecimalValue
          ? TextEditingValue(
              text: NumberFormat(
              '0.',
              this.locale,
            ).format(0))
          : oldValue;
    }

    if (!this._isValidNumber(
      newValueText,
      decimalSeparator: numberSymbols.DECIMAL_SEP,
    )) {
      return oldValue;
    }

    final dotRegExp = RegExp("\\${numberSymbols.DECIMAL_SEP}");
    final decimalMatches = dotRegExp.allMatches(newValueText);

    if (decimalMatches.length > 1) {
      return oldValue;
    }

    final int decimalSeparatorPosition =
        newValueText.indexOf(numberSymbols.DECIMAL_SEP);
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
      number = numberFormat.parse(newValueText);
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
            decimalSeparator: numberSymbols.DECIMAL_SEP,
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

  _isValidNumber(String number, {String decimalSeparator = '.'}) {
    final regExp = this.shouldAcceptDecimalValue
        ? RegExp("^\\d*(\\$decimalSeparator?\\d*)?\$")
        : RegExp(r'^\d*$');

    return regExp.hasMatch(number);
  }

  _localizeNumber(String value, {String decimalSeparator = '.'}) {
    final defaultDecimalSeparator = '.';

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

        NumberFormat numberFormatter = NumberFormat(pattern, this.locale);
        return numberFormatter.format(double.tryParse(value));
      }
    }

    return value;
  }
}
