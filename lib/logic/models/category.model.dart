import 'package:tmodel_dart/tmodel_dart.dart';

class FastCategory extends TModel {
  ///
  /// Text that describes a category label.
  ///
  final String labelText;

  ///
  /// Text that describes a category value.
  ///
  final String valueText;

  ///
  /// Represents the weight of a category.
  /// min: 0
  /// max: 9999
  ///
  final double weight;

  const FastCategory({
    required this.labelText,
    required this.valueText,
    this.weight = 0.0,
  }) : assert(weight >= 0 && weight < 1000);

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
  FastCategory merge(covariant FastCategory category) {
    return copyWith(
      labelText: category.labelText,
      valueText: category.valueText,
      weight: category.weight,
    );
  }

  @override
  List<Object> get props => [labelText, valueText, weight];
}

///
/// Internal purposes.
///
class FastInternalCategory extends FastCategory {
  ///
  /// Represents the weight of a category.
  ///
  @override
  final double weight;

  const FastInternalCategory({
    required String labelText,
    required String valueText,
    required this.weight,
  })  : assert(weight >= 1000),
        super(labelText: labelText, valueText: valueText);

  @override
  FastInternalCategory copyWith({
    String? labelText,
    String? valueText,
    double? weight,
  }) {
    return FastInternalCategory(
      labelText: labelText ?? this.labelText,
      valueText: valueText ?? this.valueText,
      weight: weight ?? this.weight,
    );
  }

  @override
  FastInternalCategory clone() {
    return FastInternalCategory(
      labelText: labelText,
      valueText: valueText,
      weight: weight,
    );
  }
}
