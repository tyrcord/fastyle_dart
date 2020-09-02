import 'package:flutter/material.dart';

import 'package:tbloc_dart/tbloc_dart.dart';

enum FastThemeBlocEventAction {
  light,
  dark,
  system,
}

class FastThemeBlocEvent extends BlocEvent<FastThemeBlocEventAction> {
  const FastThemeBlocEvent({
    @required FastThemeBlocEventAction action,
  }) : super(payload: action);

  FastThemeBlocEvent.dark() : this(action: FastThemeBlocEventAction.dark);

  FastThemeBlocEvent.light() : this(action: FastThemeBlocEventAction.light);

  FastThemeBlocEvent.system() : this(action: FastThemeBlocEventAction.system);
}
