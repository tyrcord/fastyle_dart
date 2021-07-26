import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(
      home: FastHomePage(
    children: [child],
  ));
}

void main() {
  const labelText = 'label';

  group('FastPendingReadOnlyTextField', () {
    group('#valueText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastPendingReadOnlyTextField(
                labelText: labelText,
                valueText: '42',
              ),
            ],
          )),
        );
        await tester.pumpAndSettle();

        final text = find.text('42');
        expect(text, findsOneWidget);
      });
    });

    group('#placeholderText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastPendingReadOnlyTextField(
                labelText: labelText,
                placeholderText: '42',
              ),
            ],
          )),
        );
        await tester.pumpAndSettle();

        final text = find.text('42');
        expect(text, findsOneWidget);
      });
    });

    group('#pendingText', () {
      testWidgets('should not draw it by default when set',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastPendingReadOnlyTextField(
                labelText: labelText,
                pendingText: '42',
                isPending: false,
              ),
            ],
          )),
        );
        await tester.pumpAndSettle();

        final text = find.text('42');
        expect(text, findsNothing);
      });
    });
  });
}
