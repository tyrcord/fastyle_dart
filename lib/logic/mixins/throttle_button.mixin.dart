// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

mixin FastThrottleButtonMixin<T extends FastButton> on State<T> {
  @protected
  final trottler = PublishSubject<Function>();

  @protected
  // ignore: cancel_subscriptions
  StreamSubscription<Function>? subscriptionStream;

  @protected
  VoidCallback? throttleOnTapIfNeeded() {
    if (widget.isEnabled) {
      if (widget.shouldTrottleTime) {
        subscribeToTrottlerEvents();

        return () => trottler.add(widget.onTap);
      }

      unsubscribeToTrottlerEventsIfNeeded();

      return widget.onTap;
    }

    unsubscribeToTrottlerEventsIfNeeded();

    return null;
  }

  @protected
  void subscribeToTrottlerEvents() {
    unsubscribeToTrottlerEventsIfNeeded();

    if (widget.isEnabled && widget.shouldTrottleTime) {
      subscriptionStream = trottler
          .throttleTime(widget.trottleTimeDuration)
          .listen((Function onTap) => onTap());
    }
  }

  @protected
  void unsubscribeToTrottlerEventsIfNeeded() {
    subscriptionStream?.cancel();
  }
}
