import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

mixin FastThrottleButtonMixin<T extends IFastButton> on State<T> {
  @protected
  final trottler = PublishSubject<Function>();

  @protected
  // ignore: cancel_subscriptions
  StreamSubscription<Function?>? subscriptionStream;

  @protected
  VoidCallback? throttleOnTapIfNeeded() {
    if (widget.isEnabled! && widget.shouldTrottleTime != null) {
      if (widget.shouldTrottleTime!) {
        return () => trottler.add(widget.onTap);
      }

      return widget.onTap;
    }

    return null;
  }

  @protected
  void subscribeToTrottlerEvents() {
    unsubscribeToTrottlerEventsIfNeeded();

    if (widget.trottleTimeDuration != null) {
      subscriptionStream = trottler
          .throttleTime(widget.trottleTimeDuration!)
          .listen((Function onTap) => onTap());
    }
  }

  @protected
  void unsubscribeToTrottlerEventsIfNeeded() {
    if (subscriptionStream != null) {
      subscriptionStream!.cancel();
    }
  }
}
