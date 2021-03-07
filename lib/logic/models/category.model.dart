import 'package:tmodel_dart/tmodel_dart.dart';

class FastCategory extends TModel {
  final String labelText;
  final String valueText;
  final double weight;

  const FastCategory({
    required this.labelText,
    required this.valueText,
    this.weight = 0,
  });

  @override
  FastCategory copyWith({
    String? labelText,
    String? valueText,
    double? weight,
  }) {
    return FastCategory(
      labelText: labelText ?? this.labelText,
      valueText: valueText ?? this.valueText,
      weight: weight ?? this.weight,
    );
  }

  @override
  FastCategory clone() {
    return FastCategory(
      labelText: labelText,
      valueText: valueText,
      weight: weight,
    );
  }

  @override
  FastCategory merge({FastCategory? category}) {
    assert(category != null);

    return copyWith(
      labelText: category!.labelText,
      valueText: category.valueText,
      weight: category.weight,
    );
  }

  @override
  List<Object> get props => [labelText, valueText, weight];
}
