import 'package:fastyle_dart/logic/logic.dart';
import 'package:flutter/material.dart';

class FastAppErrorReporter extends InheritedWidget {
  final IFastErrorReporter? reporter;

  const FastAppErrorReporter({
    Key? key,
    required Widget child,
    this.reporter,
  }) : super(key: key, child: child);

  static FastAppErrorReporter? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FastAppErrorReporter>();
  }

  @override
  bool updateShouldNotify(FastAppErrorReporter oldWidget) {
    return reporter != oldWidget.reporter;
  }
}
