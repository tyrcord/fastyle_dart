import 'package:tbloc_dart/tbloc_dart.dart';

enum FastThemeBlocEventType {
  system,
  light,
  dark,
}

class FastThemeBlocEvent extends BlocEvent<FastThemeBlocEventType, dynamic> {
  const FastThemeBlocEvent({
    required FastThemeBlocEventType type,
  }) : super(type: type);

  FastThemeBlocEvent.system() : this(type: FastThemeBlocEventType.system);

  FastThemeBlocEvent.light() : this(type: FastThemeBlocEventType.light);

  FastThemeBlocEvent.dark() : this(type: FastThemeBlocEventType.dark);
}
