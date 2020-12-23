import 'package:flutter/material.dart';

import 'package:tbloc_dart/tbloc_dart.dart';

enum FastThemeBlocEventType {
  light,
  dark,
  system,
}

class FastThemeBlocEvent extends BlocEvent<FastThemeBlocEventType, dynamic> {
  const FastThemeBlocEvent({
    @required FastThemeBlocEventType type,
  }) : super(type: type);

  FastThemeBlocEvent.dark() : this(type: FastThemeBlocEventType.dark);

  FastThemeBlocEvent.light() : this(type: FastThemeBlocEventType.light);

  FastThemeBlocEvent.system() : this(type: FastThemeBlocEventType.system);
}
