import 'dart:async';

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:rxdart/rxdart.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastJobRunner {
  @protected
  final BuildContext context;
  @protected
  final Iterable<FastJob> jobs;

  late Stream<double> _runner;
  bool _isRunning = false;

  FastJobRunner(this.context, [this.jobs = const <FastJob>[]]);

  Stream<double> run() {
    if (!_isRunning) {
      final progresStep = Decimal.one / Decimal.fromInt(jobs.length);
      var progress = Decimal.zero;
      var hasError = false;
      _isRunning = true;

      _runner = Stream.fromIterable(jobs)
          .takeWhile((FastJob job) => !hasError)
          .asyncExpand((FastJob job) => Stream.fromFuture(job.run(context)))
          .map((_) {
            progress += progresStep;

            return progress.toDouble();
          })
          .handleError((error) {
            hasError = true;
            throw error as Object;
          })
          .doOnDone(() => _isRunning = false)
          .doOnCancel(() => _isRunning = false);
    }

    return _runner;
  }
}
