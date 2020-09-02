import 'package:flutter/material.dart';

class FastListItemDescriptor {
  final bool isDense;
  final Widget leading;
  final Widget trailing;

  const FastListItemDescriptor({
    this.isDense = true,
    this.leading,
    this.trailing,
  });

  FastListItemDescriptor copyWith({
    bool dense,
    Widget leading,
    Widget trailing,
  }) {
    return FastListItemDescriptor(
      isDense: dense ?? this.isDense,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
    );
  }

  FastListItemDescriptor clone() {
    return FastListItemDescriptor(
      isDense: isDense,
      leading: leading,
      trailing: trailing,
    );
  }
}
