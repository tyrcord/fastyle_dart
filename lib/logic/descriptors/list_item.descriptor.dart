import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

///
/// Class that describes some visual aspects of an item.
///
class FastListItemDescriptor extends FastDescriptor {
  ///
  /// A widget to display after an item label.
  ///
  final Widget? trailing;

  ///
  /// A widget to display before an item label.
  ///
  final Widget? leading;

  ///
  /// Specifies whether an item will have the vertically dense layout.
  ///
  final bool isDense;

  const FastListItemDescriptor({
    this.isDense = true,
    this.trailing,
    this.leading,
  }) : super();

  @override
  FastListItemDescriptor copyWith({
    Widget? trailing,
    Widget? leading,
    bool? isDense,
  }) {
    return FastListItemDescriptor(
      trailing: trailing ?? this.trailing,
      isDense: isDense ?? this.isDense,
      leading: leading ?? this.leading,
    );
  }

  @override
  FastListItemDescriptor clone() {
    return FastListItemDescriptor(
      trailing: trailing,
      isDense: isDense,
      leading: leading,
    );
  }

  @override
  FastListItemDescriptor merge(covariant FastListItemDescriptor descriptor) {
    return copyWith(
      trailing: descriptor.trailing,
      isDense: descriptor.isDense,
      leading: descriptor.leading,
    );
  }

  @override
  List<Object?> get props => [trailing, isDense, leading];
}
