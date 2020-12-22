import 'package:flutter/material.dart';

class FastCategory {
  final String labelText;
  final String value;
  final double weight;

  const FastCategory({
    @required this.labelText,
    @required this.value,
    double weight = 0,
  })  : assert(labelText != null),
        assert(value != null),
        weight = weight ?? 0;

  FastCategory copyWith({String labelText, String value, double weight}) {
    return FastCategory(
      labelText: labelText ?? this.labelText,
      value: value ?? this.value,
      weight: weight ?? this.weight,
    );
  }

  FastCategory clone() {
    return FastCategory(
      labelText: labelText,
      value: value,
      weight: weight,
    );
  }
}
