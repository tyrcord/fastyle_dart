import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// FIXME: only support period decimal separator
class NumberInputFormatter extends TextInputFormatter {
  final bool transformInvalidNumber;
  final bool acceptDecimal;
  final int maxLength;
  final int maxValue;

  static const int safeInteger = 9007199254740992; // 2^53
  static const int safeIntegerMaxLength = 16;
  static const String defaultLocale = 'en_US';
  static const String defaultDecimalSeparator = '.';

  static const String _commaDecimalSeparator = ',';
  static TextEditingValue? _zeroTextEditingValue;
  static final _integerRegExp = RegExp(r'^\d*$');
  static NumberFormat? _defaultNumberFormat;
  static final _commaRegExp = RegExp(',');
  static final _periodRegExp = RegExp('\\.');

  static NumberFormat get defaultNumberFormat {
    _defaultNumberFormat ??= NumberFormat.decimalPattern(defaultLocale);
    return _defaultNumberFormat!;
  }

  static TextEditingValue get _prefixedDecimalSeprator {
    _zeroTextEditingValue ??= TextEditingValue(
      text: NumberFormat('0.', defaultLocale).format(0),
      selection: TextSelection(baseOffset: 2, extentOffset: 2),
    );

    return _zeroTextEditingValue!;
  }

  NumberInputFormatter({
    this.maxLength = NumberInputFormatter.safeIntegerMaxLength,
    this.maxValue = NumberInputFormatter.safeInteger,
    this.acceptDecimal = true,
    this.transformInvalidNumber = true,
  })  : assert(maxValue <= NumberInputFormatter.safeInteger),
        assert(maxLength <= NumberInputFormatter.safeIntegerMaxLength);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var valueText = newValue.text;

    if (valueText.isEmpty) {
      return newValue;
    }

    valueText = _sanitizeDecimalSeparatorIfNeeded(valueText);

    if (acceptDecimal && valueText == defaultDecimalSeparator) {
      return acceptDecimal ? _prefixedDecimalSeprator : oldValue;
    }

    if (!_isStringANumber(valueText)) {
      return oldValue;
    }

    final periods = _periodRegExp.allMatches(valueText);

    if (periods.length > 1) {
      return oldValue;
    }

    if (_isStringTooLong(valueText)) {
      return oldValue;
    }

    num? number;

    try {
      number = defaultNumberFormat.parse(valueText);
      // ignore: empty_catches
    } catch (e) {}

    if (number != null) {
      if (number > maxValue) {
        return oldValue;
      }

      return TextEditingValue(
        text: _formatNumberToString(number, valueText, periods.isNotEmpty),
        selection: newValue.selection,
      );
    }

    return oldValue;
  }

  bool _isStringTooLong(String text) {
    final decimalSeparatorPosition = text.indexOf(
      defaultDecimalSeparator,
    );

    var textLength = text.length;

    if (decimalSeparatorPosition > -1 && decimalSeparatorPosition < maxLength) {
      --textLength;
    }

    return textLength > maxLength;
  }

  bool _isStringANumber(
    String number, {
    String decimalSeparator = defaultDecimalSeparator,
  }) {
    final regExp = acceptDecimal
        ? RegExp('^\\d*(\\$decimalSeparator?\\d*)?\$')
        : _integerRegExp;

    return regExp.hasMatch(number);
  }

  String _sanitizeDecimalSeparatorIfNeeded(String text) {
    if (acceptDecimal && text.contains(_commaDecimalSeparator)) {
      text = text.replaceFirst(_commaRegExp, defaultDecimalSeparator);
    }

    return text;
  }

  String _formatNumberToString(num number, String raw, bool isDecimal) {
    if (transformInvalidNumber) {
      if (isDecimal && acceptDecimal) {
        final numberParts = raw.split(defaultDecimalSeparator);
        final integerPart = numberParts[0];
        final fractionalPart = numberParts[1];
        final fractionalLength = fractionalPart.length;

        if (fractionalLength > 0) {
          // [integer].[fractional]
          return _formatDecimalNumberToString(
            number.toStringAsFixed(fractionalLength),
            decimalSeparator: defaultDecimalSeparator,
          );
        } else {
          // [integer].
          return '${int.tryParse(integerPart) ?? 0}$defaultDecimalSeparator';
        }
      } else {
        // [interger]
        return number.toStringAsFixed(0);
      }
    }

    return raw;
  }

  String _formatDecimalNumberToString(
    String value, {
    String decimalSeparator = defaultDecimalSeparator,
  }) {
    if (decimalSeparator != defaultDecimalSeparator) {
      final numberParts = value.split(defaultDecimalSeparator);
      final integerPart = numberParts[0];
      final fractionalPart = numberParts[1];

      if (numberParts.length > 1) {
        var pattern = '';

        for (var i = 0; i < integerPart.length; i++) {
          pattern += '0';
        }

        pattern += defaultDecimalSeparator;

        for (var i = 0; i < fractionalPart.length; i++) {
          pattern += '0';
        }

        final numberFormatter = NumberFormat(pattern, defaultLocale);
        return numberFormatter.format(double.tryParse(value));
      }
    }

    return value;
  }
}
