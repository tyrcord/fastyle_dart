// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async/async.dart';
import 'package:tbloc/tbloc.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

abstract class FastJob {
  @protected
  final bool requestUserInteraction;
  @protected
  final String? debugLabel;
  @protected
  final Duration timeLimit;

  const FastJob({
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
    debugPrint('Job started: $debugLabel');

    final completer = Completer<bool>();
    var operationAsync = initialize(context, errorReporter: errorReporter);

    if (!requestUserInteraction) {
      operationAsync = operationAsync.timeout(timeLimit);
    } else {
      // Wait for the next frame to ensure that
      // the next job can request a user interaction.
      operationAsync = operationAsync.then((value) {
        final userInteractionCompleter = Completer<void>();

        WidgetsBinding.instance.scheduleFrameCallback((_) {
          userInteractionCompleter.complete();
        });

        return userInteractionCompleter.future;
      });
    }

    final blocInitializationOperation = CancelableOperation.fromFuture(
      operationAsync,
    );

    operationAsync.catchError((dynamic error, StackTrace? stackTrace) {
      debugPrint('Job failed: $debugLabel');
      blocInitializationOperation.cancel();
      completer.completeError(_transformError(error, stackTrace));
    }).whenComplete(() {
      if (!completer.isCompleted) {
        debugPrint('Job completed: $debugLabel');
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
