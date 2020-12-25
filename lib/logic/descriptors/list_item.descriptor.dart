import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastListItemDescriptor extends FastDescriptor {
  final Widget trailing;
  final Widget leading;
  final bool isDense;

  const FastListItemDescriptor({
    bool isDense = true,
    this.trailing,
    this.leading,
  })  : isDense = isDense ?? true,
        super();

  @override
  FastListItemDescriptor copyWith({
    Widget trailing,
    Widget leading,
    bool isDense,
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
  FastListItemDescriptor merge({@required FastListItemDescriptor descriptor}) {
    return FastListItemDescriptor(
      trailing: descriptor.trailing,
      isDense: descriptor.isDense,
      leading: descriptor.leading,
    );
  }

  @override
  List<Object> get props => [trailing, isDense, leading];
}
