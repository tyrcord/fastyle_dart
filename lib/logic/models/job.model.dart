import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

abstract class FastJob {
  @protected
  final bool requestUserInteraction;
  @protected
  final String? debugLabel;
  @protected
  final Duration timeLimit;

  FastJob({
    this.timeLimit = const Duration(seconds: 15),
    this.requestUserInteraction = false,
    this.debugLabel,
  });

  @protected
  Future<void> initialize(
    BuildContext context, {
    IFastErrorReporter? errorReporter,
  });

  Future<bool> run(
    BuildContext context, {
    IFastErrorReporter? errorReporter,
  }) {
    final completer = Completer<bool>();
    final operationAsync = initialize(context, errorReporter: errorReporter);
    final blocInitializationOperation = CancelableOperation.fromFuture(
      operationAsync,
    );

    if (!requestUserInteraction) {
      operationAsync.timeout(timeLimit);
    }

    operationAsync
      ..catchError((dynamic error, StackTrace? stackTrace) {
        blocInitializationOperation.cancel();

        completer.completeError(
          FastJobError(
            stackTrace: stackTrace ?? StackTrace.current,
            debugLabel: debugLabel,
            source: error,
          ),
        );
      })
      ..whenComplete(() {
        if (!completer.isCompleted) {
          completer.complete(true);
        }
      });

    return completer.future;
  }
}
