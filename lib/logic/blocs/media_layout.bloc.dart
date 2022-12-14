import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class FastMediaLayoutBloc extends BidirectionalBloc<FastMediaLayoutBlocEvent,
    FastMediaLayoutBlocState> {
  FastMediaLayoutBloc({
    FastMediaLayoutBlocState? initialState,
  }) : super(initialState: initialState ?? const FastMediaLayoutBlocState());

  @override
  Stream<FastMediaLayoutBlocState> mapEventToState(
    FastMediaLayoutBlocEvent event,
  ) async* {
    if (event.type == FastMediaLayoutBlocEventType.changed) {
      var mediaType = event.payload as FastMediaType;

      yield currentState.copyWith(mediaType: mediaType);
    }
  }
}