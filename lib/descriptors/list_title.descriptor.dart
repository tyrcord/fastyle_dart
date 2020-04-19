import 'package:flutter/material.dart';

class FastListTileDescriptor {
  final bool isDense;
  final Widget leading;
  final Widget trailing;

  const FastListTileDescriptor({
    this.isDense = true,
    this.leading,
    this.trailing,
  });

  FastListTileDescriptor copyWith({
    bool dense,
    Widget leading,
    Widget trailing,
  }) {
    return FastListTileDescriptor(
      isDense: dense ?? this.isDense,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
    );
  }

  FastListTileDescriptor clone() {
    return FastListTileDescriptor(
      isDense: isDense,
      leading: leading,
      trailing: trailing,
    );
  }
}
