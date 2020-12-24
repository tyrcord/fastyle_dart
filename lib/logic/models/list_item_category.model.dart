import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

import 'package:tmodel_dart/tmodel_dart.dart';

class FastListItemCategory<T extends FastItem> extends TModel {
  final String labelText;
  final List<T> items;
  final double weight;
  final String valueText;

  const FastListItemCategory({
    @required this.labelText,
    @required this.valueText,
    @required this.items,
    double weight = 0,
  })  : assert(items != null),
        assert(labelText != null),
        assert(valueText != null),
        weight = weight ?? 0;

  @override
  FastListItemCategory<T> copyWith({
    String labelText,
    String valueText,
    List<T> items,
    double weight,
  }) {
    return FastListItemCategory(
      labelText: labelText ?? this.labelText,
      valueText: valueText ?? this.valueText,
      weight: weight ?? this.weight,
      items: items ?? this.items,
    );
  }

  @override
  FastListItemCategory<T> clone() {
    return FastListItemCategory(
      labelText: labelText,
      valueText: valueText,
      weight: weight,
      items: items,
    );
  }

  @override
  FastListItemCategory<T> merge({@required FastListItemCategory<T> category}) {
    assert(category != null);

    return copyWith(
      labelText: category.labelText,
      valueText: category.valueText,
      weight: category.weight,
      items: category.items,
    );
  }

  @override
  List<Object> get props => [labelText, valueText, weight, items];
}
