import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

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
    var operationAsync = initialize(context, errorReporter: errorReporter);

    if (!requestUserInteraction) {
      operationAsync = operationAsync.timeout(timeLimit);
    }

    final blocInitializationOperation = CancelableOperation.fromFuture(
      operationAsync,
    );

    operationAsync.catchError((dynamic error, StackTrace? stackTrace) {
      blocInitializationOperation.cancel();
      completer.completeError(_transformError(error, stackTrace));
    }).whenComplete(() {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    });

    return completer.future;
  }

  FastJobError _transformError(dynamic error, StackTrace? stackTrace) {
    if (error is BlocError) {
      return FastJobError(
        stackTrace: error.stackTrace,
        debugLabel: debugLabel,
        source: error.source,
      );
    }

    return FastJobError(
      stackTrace: stackTrace ?? StackTrace.current,
      debugLabel: debugLabel,
      source: error,
    );
  }
}
