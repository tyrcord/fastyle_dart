import 'package:flutter/material.dart';

class FastWelcomeViewController extends ValueNotifier<bool> {
  FastWelcomeViewController({bool isPending = false}) : super(isPending);

  resume() {
    if (value) {
      value = false;
      notifyListeners();
    }
  }

  pause() {
    if (!value) {
      value = true;
      notifyListeners();
    }
  }
}
