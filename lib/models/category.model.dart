import 'package:flutter/material.dart';

class FastCategory {
  final String labelText;
  final String value;

  const FastCategory({
    @required this.labelText,
    @required this.value,
  })  : assert(labelText != null),
        assert(value != null);

  FastCategory copyWith({String label, String value}) {
    return FastCategory(
      labelText: label ?? this.labelText,
      value: value ?? this.value,
    );
  }

  FastCategory clone() {
    return FastCategory(
      labelText: labelText,
      value: value,
    );
  }
}
