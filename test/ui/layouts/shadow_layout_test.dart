// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: child);
}

void main() {
  const cardText = 'CARD';

  group('FastShadowLayout', () {
    testWidgets('should draw its child', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastShadowLayout(
          child: Text(cardText),
        )),
      );

      await tester.pumpAndSettle();
      final button = find.byType(FastShadowLayout);
      final text = find.text(cardText);

      expect(button, findsOneWidget);
      expect(text, findsOneWidget);
    });
  });
}
