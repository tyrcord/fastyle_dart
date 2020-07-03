import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastItem<T> {
  final String label;
  final String normalizedLabel;
  final T value;
  final String description;
  final List<FastCategory> categories;
  final bool isEnabled;
  final FastListTileDescriptor descriptor;

  const FastItem({
    @required this.label,
    this.value,
    this.description,
    this.categories,
    this.isEnabled = true,
    this.descriptor,
    this.normalizedLabel,
  });

  FastItem<T> copyWith({
    String label,
    T value,
    String description,
    bool enabled,
    bool selected,
    String normalizedLabel,
  }) {
    return FastItem(
      label: label ?? this.label,
      value: value ?? this.value,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      isEnabled: enabled ?? this.isEnabled,
      descriptor: descriptor ?? this.descriptor,
      normalizedLabel: normalizedLabel ?? this.normalizedLabel,
    );
  }

  FastItem<T> clone() {
    return FastItem(
      label: label,
      value: value,
      description: description,
      categories: categories,
      isEnabled: isEnabled,
      descriptor: descriptor != null ? descriptor.clone() : null,
      normalizedLabel: normalizedLabel,
    );
  }
}
