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

  const FastThemeBlocEvent.system() : this(type: FastThemeBlocEventType.system);

  const FastThemeBlocEvent.light() : this(type: FastThemeBlocEventType.light);

  const FastThemeBlocEvent.dark() : this(type: FastThemeBlocEventType.dark);
}
