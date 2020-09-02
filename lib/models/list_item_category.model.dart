import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListItemCategory<T extends FastItem> {
  final String labelText;
  final List<T> items;
  final String value;

  const FastListItemCategory({
    @required this.items,
    @required this.labelText,
    @required this.value,
  });

  FastListItemCategory<T> copyWith({
    List<T> items,
    String labelText,
    String value,
  }) {
    return FastListItemCategory(
      items: items ?? this.items,
      labelText: labelText ?? this.labelText,
      value: value ?? this.value,
    );
  }

  FastListItemCategory<T> clone() {
    return FastListItemCategory(
      items: items,
      labelText: labelText,
      value: value,
    );
  }
}
