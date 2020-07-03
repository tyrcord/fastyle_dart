import 'package:flutter/material.dart';

class FastCategory {
  final String label;
  final String value;

  const FastCategory({
    @required this.label,
    @required this.value,
  });

  FastCategory copyWith({
    String label,
    String value,
  }) {
    return FastCategory(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  FastCategory clone() {
    return FastCategory(
      label: label,
      value: value,
    );
  }
}
