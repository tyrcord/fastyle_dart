import 'package:flutter/material.dart';

class FastWelcomeViewController extends ValueNotifier<bool> {
  FastWelcomeViewController({bool isPending = false}) : super(isPending);

  void resume() {
    if (value) {
      value = false;
      notifyListeners();
    }
  }

  void pause() {
    if (!value) {
      value = true;
      notifyListeners();
    }
  }
}
