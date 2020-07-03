import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListItemCategory<T extends FastItem> {
  final List<T> items;
  final String label;
  final String value;

  const FastListItemCategory({
    @required this.items,
    @required this.label,
    @required this.value,
  });

  FastListItemCategory<T> copyWith({
    List<T> items,
    String label,
    String value,
  }) {
    return FastListItemCategory(
      items: items ?? this.items,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  FastListItemCategory<T> clone() {
    return FastListItemCategory(
      items: items,
      label: label,
      value: value,
    );
  }
}
