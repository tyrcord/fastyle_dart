import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

import 'package:tmodel_dart/tmodel_dart.dart';

class FastListItemCategory<T extends FastItem> extends TModel {
  final String labelText;
  final List<T> items;
  final double weight;
  final String value;

  const FastListItemCategory({
    @required this.labelText,
    @required this.items,
    @required this.value,
    double weight = 0,
  })  : assert(items != null),
        assert(labelText != null),
        assert(value != null),
        weight = weight ?? 0;

  @override
  FastListItemCategory<T> copyWith({
    String labelText,
    List<T> items,
    double weight,
    String value,
  }) {
    return FastListItemCategory(
      labelText: labelText ?? this.labelText,
      weight: weight ?? this.weight,
      value: value ?? this.value,
      items: items ?? this.items,
    );
  }

  @override
  FastListItemCategory<T> clone() {
    return FastListItemCategory(
      labelText: labelText,
      weight: weight,
      value: value,
      items: items,
    );
  }

  @override
  FastListItemCategory<T> merge({@required FastListItemCategory<T> category}) {
    assert(category != null);

    return copyWith(
      labelText: category.labelText,
      weight: category.weight,
      value: category.value,
      items: category.items,
    );
  }

  @override
  List<Object> get props => [labelText, value, weight, items];
}
