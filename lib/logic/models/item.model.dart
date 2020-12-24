import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tmodel_dart/tmodel_dart.dart';

class FastItem<T> extends TModel {
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
  })  : isEnabled = isEnabled ?? true,
        assert(labelText != null);

  @override
  // ignore: code-metrics
  FastItem<T> copyWith({
    FastListItemDescriptor descriptor,
    List<FastCategory> categories,
    String normalizedLabelText,
    String descriptionText,
    String labelText,
    bool isEnabled,
    T value,
  }) {
    return FastItem<T>(
      normalizedLabelText: normalizedLabelText ?? this.normalizedLabelText,
      descriptionText: descriptionText ?? this.descriptionText,
      categories: categories ?? this.categories,
      descriptor: descriptor ?? this.descriptor,
      isEnabled: isEnabled ?? this.isEnabled,
      labelText: labelText ?? this.labelText,
      value: value ?? this.value,
    );
  }

  @override
  FastItem<T> clone() {
    return FastItem<T>(
      descriptor: descriptor != null ? descriptor.clone() : null,
      normalizedLabelText: normalizedLabelText,
      descriptionText: descriptionText,
      categories: categories,
      isEnabled: isEnabled,
      labelText: labelText,
      value: value,
    );
  }

  @override
  FastItem<T> merge({@required FastItem<T> item}) {
    assert(item != null);

    return copyWith(
      normalizedLabelText: item.normalizedLabelText,
      descriptionText: item.descriptionText,
      categories: item.categories,
      descriptor: item.descriptor,
      isEnabled: item.isEnabled,
      labelText: item.labelText,
      value: item.value,
    );
  }

  @override
  List<Object> get props => [
        normalizedLabelText,
        descriptionText,
        categories,
        descriptor,
        isEnabled,
        labelText,
        value,
      ];
}
