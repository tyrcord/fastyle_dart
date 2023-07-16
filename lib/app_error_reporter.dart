// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fastyle_dart/logic/logic.dart';

class FastAppErrorReporter extends InheritedWidget {
  final IFastErrorReporter? reporter;

  const FastAppErrorReporter({
    super.key,
    required super.child,
    this.reporter,
  });

  static FastAppErrorReporter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FastAppErrorReporter>();
  }

  @override
  bool updateShouldNotify(FastAppErrorReporter oldWidget) {
    return reporter != oldWidget.reporter;
  }
}
