import 'package:fastyle_dart/descriptors/descriptor.dart';
import 'package:flutter/material.dart';

class FastListItemDescriptor extends FastDescriptor {
  final bool isDense;
  final Widget leading;
  final Widget trailing;

  const FastListItemDescriptor({
    bool isDense = true,
    this.leading,
    this.trailing,
  })  : isDense = isDense ?? true,
        super();

  @override
  FastListItemDescriptor copyWith({
    bool isDense,
    Widget leading,
    Widget trailing,
  }) {
    return FastListItemDescriptor(
      isDense: isDense ?? this.isDense,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
    );
  }

  @override
  FastListItemDescriptor clone() {
    return FastListItemDescriptor(
      isDense: isDense,
      leading: leading,
      trailing: trailing,
    );
  }
}
