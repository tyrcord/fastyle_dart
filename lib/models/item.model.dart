import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastItem<T> {
  final FastListItemDescriptor descriptor;
  final List<FastCategory> categories;
  final String normalizedLabelText;
  final String descriptionText;
  final String labelText;
  final bool isEnabled;
  final T value;

  const FastItem({
    @required this.labelText,
    this.normalizedLabelText,
    bool isEnabled = true,
    this.descriptionText,
    this.categories,
    this.descriptor,
    this.value,
  })  : this.isEnabled = isEnabled ?? true,
        assert(labelText != null);

  FastItem<T> copyWith({
    FastListItemDescriptor descriptor,
    List<FastCategory> categories,
    String normalizedLabelText,
    String descriptionText,
    String labelText,
    bool isEnabled,
    T value,
  }) {
    return FastItem(
      normalizedLabelText: normalizedLabelText ?? this.normalizedLabelText,
      descriptionText: descriptionText ?? this.descriptionText,
      categories: categories ?? this.categories,
      descriptor: descriptor ?? this.descriptor,
      isEnabled: isEnabled ?? this.isEnabled,
      labelText: labelText ?? this.labelText,
      value: value ?? this.value,
    );
  }

  FastItem<T> clone() {
    return FastItem(
      descriptor: descriptor != null ? descriptor.clone() : null,
      normalizedLabelText: normalizedLabelText,
      descriptionText: descriptionText,
      categories: categories,
      isEnabled: isEnabled,
      labelText: labelText,
      value: value,
    );
  }
}
