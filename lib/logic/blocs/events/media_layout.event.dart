import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

enum FastMediaLayoutBlocEventType {
  changed,
}

class FastMediaLayoutBlocEvent
    extends BlocEvent<FastMediaLayoutBlocEventType, FastMediaType> {
  const FastMediaLayoutBlocEvent({
    required FastMediaLayoutBlocEventType type,
    FastMediaType? mediaType,
  }) : super(type: type, payload: mediaType);

  FastMediaLayoutBlocEvent.changed(FastMediaType mediaType)
      : this(
          type: FastMediaLayoutBlocEventType.changed,
          mediaType: mediaType,
        );
}
