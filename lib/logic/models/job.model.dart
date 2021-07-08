import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

abstract class FastJob {
  @protected
  final Map<String, dynamic>? details;
  final bool requestUserInteraction;
  final String? debugLabel;
  final Duration timeLimit;

  FastJob({
    this.timeLimit = const Duration(seconds: 15),
    this.requestUserInteraction = false,
    this.debugLabel,
    this.details,
  });

  @protected
  Future<void> initialize(
    BuildContext context, {
    Map<String, dynamic>? details,
  });

  Future<bool> run(BuildContext context) {
    final completer = Completer<bool>();
    final operationAsync = initialize(context, details: details);
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
