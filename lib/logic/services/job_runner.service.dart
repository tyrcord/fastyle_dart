import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class FastJobRunner {
  @protected
  final BuildContext context;
  @protected
  final Iterable<FastJob> jobs;

  late Stream<double> _runner;
  bool _isRunning = false;

  FastJobRunner(this.context, [this.jobs = const <FastJob>[]]);

  Stream<double> run({
    IFastErrorReporter? errorReporter,
  }) {
    if (!_isRunning) {
      final rProgresStep = Decimal.one / Decimal.fromInt(jobs.length);
      final dProgresStep = rProgresStep.toDecimal(scaleOnInfinitePrecision: 32);
      var progress = Decimal.zero;
      var hasError = false;
      _isRunning = true;

      _runner = Stream.fromIterable(jobs)
          .takeWhile((FastJob job) => !hasError)
          .asyncExpand((FastJob job) => Stream.fromFuture(
                job.run(context, errorReporter: errorReporter),
              ))
          .map((_) {
            progress += dProgresStep;

            return progress.toDouble();
          })
          .handleError((error) {
            hasError = true;

            if (error is FastJobError) {
              errorReporter?.recordError(
                error.source,
                error.stackTrace,
                reason: error.debugLabel,
              );
            } else {
              errorReporter?.recordError(
                error,
                StackTrace.current,
              );
            }

            throw error as Object;
          })
          .doOnDone(() => _isRunning = false)
          .doOnCancel(() => _isRunning = false);
    }

    return _runner;
  }
}
