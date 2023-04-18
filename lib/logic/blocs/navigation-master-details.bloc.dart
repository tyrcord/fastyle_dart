import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc/tbloc.dart';

class FastNavigationSplitViewBloc extends BidirectionalBloc<
    FastNavigationSplitViewBlocEvent, FastNavigationSplitViewState> {
  FastNavigationSplitViewBloc({
    FastNavigationSplitViewState? initialState,
  }) : super(
          initialState: initialState ?? const FastNavigationSplitViewState(),
        );

  @override
  Stream<FastNavigationSplitViewState> mapEventToState(
    FastNavigationSplitViewBlocEvent event,
  ) async* {
    if (event.type == FastNavigationSplitViewEventType.changed) {
      var item = event.payload;

      yield currentState.copyWith(item: item);
    }
  }
}
