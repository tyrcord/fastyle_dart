import 'package:flutter/material.dart';

class FastCategory<T> {
  final String label;
  final T value;

  const FastCategory({
    @required this.label,
    @required this.value,
  });

  FastCategory copyWith({
    String label,
    T value,
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
