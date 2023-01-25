import 'dart:async';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

mixin FastDebounceInputMixin<T extends IFastInput> on State<T> {
  @protected
  final debouncer = PublishSubject<Function>();

  @protected
  // ignore: cancel_subscriptions
  StreamSubscription<Function>? subscriptionStream;

  @protected
  ValueChanged<String>? debounceOnValueChangedIfNeeded() {
    if (widget.isEnabled && widget.onValueChanged != null) {
      if (widget.shouldDebounceTime) {
        subscribeToDebouncerEvents();

        return (String value) {
          return debouncer.add(() => widget.onValueChanged!(value));
        };
      }

      unsubscribeToDebouncerEventsIfNeeded();

      return widget.onValueChanged;
    }

    unsubscribeToDebouncerEventsIfNeeded();

    return null;
  }

  @protected
  void subscribeToDebouncerEvents() {
    unsubscribeToDebouncerEventsIfNeeded();

    if (widget.isEnabled && widget.shouldDebounceTime) {
      subscriptionStream = debouncer
          .debounceTime(widget.debounceTimeDuration)
          .listen((Function dispatchValueChanged) => dispatchValueChanged());
    }
  }

  @protected
  void unsubscribeToDebouncerEventsIfNeeded() {
    subscriptionStream?.cancel();
  }
}
