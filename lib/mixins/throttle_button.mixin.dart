import 'dart:async';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

mixin FastThrottleButtonMixin<T extends IFastButton> on State<T> {
  @protected
  final trottler = PublishSubject<Function>();
  @protected
  StreamSubscription<Function> subscriptionStream;

  @protected
  Function throttleOnTapIfNeeded() {
    if (widget.isEnabled && widget.onTap != null) {
      if (widget.shouldTrottleTime) {
        return () => trottler.add(widget.onTap);
      }

      return widget.onTap;
    }

    return null;
  }

  @protected
  void subscribeToTrottlerEvents() {
    unsubscribeToTrottlerEventsIfNeeded();

    subscriptionStream = trottler
        .throttleTime(widget.trottleTimeDuration)
        .listen((Function onTap) => onTap());
  }

  @protected
  void unsubscribeToTrottlerEventsIfNeeded() {
    if (subscriptionStream != null) {
      subscriptionStream.cancel();
    }
  }
}