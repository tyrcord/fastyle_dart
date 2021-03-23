import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: FastHomePage(children: [child]));
}

void main() {
  group('FastDialog', () {
    const titleText = 'dialog';

    testWidgets('should draw its title', (WidgetTester tester) async {
      var children = [Text('42')];

      await tester.pumpWidget(
        _buildApp(FastDialog(
          titleText: titleText,
          children: children,
        )),
        Duration(milliseconds: 60),
      );

      final text = find.text(titleText);

      expect(text, findsOneWidget);
    });

    testWidgets('should draw its children', (WidgetTester tester) async {
      var children = [Text('42')];

      await tester.pumpWidget(
        _buildApp(FastDialog(
          titleText: titleText,
          children: children,
        )),
        Duration(milliseconds: 60),
      );

      final dialog = find.byType(FastDialog);

      expect(dialog, findsOneWidget);
    });
  });
}
