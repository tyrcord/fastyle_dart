import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListItemCategory<T> {
  final List<FastItem> items;
  final String label;
  final T value;

  const FastListItemCategory({
    @required this.items,
    @required this.label,
    @required this.value,
  });

  FastListItemCategory copyWith({
    List<FastItem> items,
    String label,
    T value,
  }) {
    return FastListItemCategory(
      items: items ?? this.items,
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }

  FastListItemCategory clone() {
    return FastListItemCategory(
      items: items,
      label: label,
      value: value,
    );
  }
}
