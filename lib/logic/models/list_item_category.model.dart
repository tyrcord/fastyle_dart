import 'package:fastyle_dart/fastyle_dart.dart';

import 'package:tmodel/tmodel.dart';

class FastListItemCategory<T extends FastItem> extends TModel {
  ///
  /// Text that describes an item label.
  ///
  final String labelText;

  ///
  /// Text that describes an item value.
  ///
  final String valueText;

  ///
  /// Text that describes an item label.
  ///
  final List<T> items;

  ///
  /// Represents the weight of a category.
  ///
  final double weight;

  const FastListItemCategory({
    required this.labelText,
    required this.valueText,
    required this.items,
    this.weight = 0.0,
  });

  @override
  FastListItemCategory<T> copyWith({
    String? labelText,
    String? valueText,
    List<T>? items,
    double? weight,
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
  FastListItemCategory<T> merge(covariant FastListItemCategory<T> model) {
    return copyWith(
      labelText: model.labelText,
      valueText: model.valueText,
      weight: model.weight,
      items: model.items,
    );
  }

  @override
  List<Object> get props => [labelText, valueText, weight, items];
}
