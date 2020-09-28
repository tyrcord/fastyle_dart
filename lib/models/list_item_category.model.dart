import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListItemCategory<T extends FastItem> {
  final String labelText;
  final List<T> items;
  final String value;
  final double weight;

  const FastListItemCategory({
    @required this.items,
    @required this.labelText,
    @required this.value,
    double weight = 0,
  })  : assert(items != null),
        assert(labelText != null),
        assert(value != null),
        weight = weight ?? 0;

  FastListItemCategory<T> copyWith({
    List<T> items,
    String labelText,
    String value,
    double weight,
  }) {
    return FastListItemCategory(
      items: items ?? this.items,
      labelText: labelText ?? this.labelText,
      value: value ?? this.value,
      weight: weight ?? this.weight,
    );
  }

  FastListItemCategory<T> clone() {
    return FastListItemCategory(
      items: items,
      labelText: labelText,
      value: value,
      weight: weight,
    );
  }
}
