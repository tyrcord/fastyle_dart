import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

class FastAppLoaderBloc
    extends BidirectionalBloc<FastAppLoaderBlocEvent, FastAppLoaderBlocState> {
  static FastAppLoaderBloc? _singleton;

  factory FastAppLoaderBloc({
    FastAppLoaderBlocState? initialState,
  }) {
    if (_singleton == null || (_singleton != null && _singleton!.isClosed)) {
      _singleton = FastAppLoaderBloc._(initialState);
    }

    return _singleton!;
  }

  FastAppLoaderBloc._(
    FastAppLoaderBlocState? initialState,
  ) : super(initialState: initialState ?? const FastAppLoaderBlocState());

  @override
  Stream<FastAppLoaderBlocState> mapEventToState(
    FastAppLoaderBlocEvent event,
  ) async* {
    final eventPayload = event.payload;
    final eventType = event.type;

    if (eventType == FastAppLoaderBlocEventType.init &&
        !isInitialized &&
        !isInitializing) {
      var jobs = eventPayload!.jobs;
      var errorReporter = eventPayload.errorReporter;
      isInitializing = true;

      yield currentState.copyWith(isLoading: isInitializing);

      if (jobs != null && jobs.isNotEmpty) {
        yield* _runJobs(
          eventPayload.context!,
          jobs,
          errorReporter: errorReporter,
        );
      } else {
        addEvent(FastAppLoaderBlocEvent.initialized());
      }
    } else if (eventType == FastAppLoaderBlocEventType.initialized &&
        !isInitialized &&
        isInitializing) {
      isInitializing = false;
      isInitialized = true;

      yield currentState.copyWith(
        isLoading: isInitializing,
        isLoaded: isInitialized,
      );
    } else if (eventType == FastAppLoaderBlocEventType.initFailed) {
      isInitializing = false;
      isInitialized = false;

      yield currentState.copyWith(
        error: eventPayload!.error,
        isLoading: isInitializing,
        isLoaded: isInitialized,
        progress: 0,
      );
    }
  }

  Stream<FastAppLoaderBlocState> _runJobs(
    BuildContext context,
    Iterable<FastJob> jobs, {
    IFastErrorReporter? errorReporter,
  }) async* {
    final jobRunner = FastJobRunner(context, jobs);
    final stream = jobRunner.run(errorReporter: errorReporter);

    try {
      await for (final currentProgress in stream) {
        yield currentState.copyWith(progress: currentProgress);
      }

      await Future.delayed(const Duration(milliseconds: 60));
      addEvent(FastAppLoaderBlocEvent.initialized());
    } catch (error) {
      addEvent(FastAppLoaderBlocEvent.initFailed(error));
    }
  }
}
