import 'package:flutter/material.dart';

import 'package:tmodel_dart/tmodel_dart.dart';

class FastCategory extends TModel {
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

  @override
  FastCategory copyWith({String labelText, String value, double weight}) {
    return FastCategory(
      labelText: labelText ?? this.labelText,
      weight: weight ?? this.weight,
      value: value ?? this.value,
    );
  }

  @override
  FastCategory clone() {
    return FastCategory(
      labelText: labelText,
      weight: weight,
      value: value,
    );
  }

  @override
  FastCategory merge({@required FastCategory category}) {
    assert(category != null);

    return copyWith(
      labelText: category.labelText,
      weight: category.weight,
      value: category.value,
    );
  }

  @override
  List<Object> get props => [labelText, value, weight];
}
