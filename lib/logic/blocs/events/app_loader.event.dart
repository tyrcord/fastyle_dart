import 'package:fastyle_dart/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

enum FastAppLoaderBlocEventType {
  init,
  initialized,
  initFailed,
}

class FastAppLoaderBlocEventPayload {
  final Iterable<FastJob>? jobs;
  final BuildContext? context;
  final Object? error;

  FastAppLoaderBlocEventPayload({
    this.context,
    this.error,
    this.jobs,
  });
}

class FastAppLoaderBlocEvent extends BlocEvent<FastAppLoaderBlocEventType,
    FastAppLoaderBlocEventPayload> {
  const FastAppLoaderBlocEvent({
    required FastAppLoaderBlocEventType type,
    FastAppLoaderBlocEventPayload? payload,
  }) : super(type: type, payload: payload);

  FastAppLoaderBlocEvent.init(
    BuildContext context,
    Iterable<FastJob>? jobs,
  ) : this(
          type: FastAppLoaderBlocEventType.init,
          payload: FastAppLoaderBlocEventPayload(jobs: jobs, context: context),
        );

  FastAppLoaderBlocEvent.initialized()
      : this(type: FastAppLoaderBlocEventType.initialized);

  FastAppLoaderBlocEvent.initFailed(Object error)
      : this(
          type: FastAppLoaderBlocEventType.initFailed,
          payload: FastAppLoaderBlocEventPayload(error: error),
        );
}
