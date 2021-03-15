import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const _kButtonText = 'BUTTON';

FastApp _buildApp(Widget child) {
  return FastApp(home: child);
}

void main() {
  group('FastButtonLayout', () {
    testWidgets('should draw its child', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastButtonLayout(
          child: Text(_kButtonText),
        )),
        Duration(milliseconds: 60),
      );

      final button = find.byType(FastButtonLayout);
      final text = find.text(_kButtonText);

      expect(button, findsOneWidget);
      expect(text, findsOneWidget);
    });

    testWidgets('should have a min height', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastButtonLayout(
          child: Text(_kButtonText),
        )),
        Duration(milliseconds: 60),
      );

      final button = find.byType(FastButtonLayout);
      final baseSize = tester.getSize(button);

      expect(button, findsOneWidget);
      expect(baseSize.height, greaterThanOrEqualTo(40.0));
    });

    testWidgets('should have a min width', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastButtonLayout(
          child: Text(_kButtonText),
        )),
        Duration(milliseconds: 60),
      );

      final button = find.byType(FastButtonLayout);
      final baseSize = tester.getSize(button);

      expect(button, findsOneWidget);
      expect(baseSize.width, greaterThanOrEqualTo(44.0));
    });
  });
}
