import 'package:flutter/material.dart';

class FastWelcomeViewController extends ValueNotifier<bool> {
  FastWelcomeViewController(bool isPending) : super(isPending);

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
