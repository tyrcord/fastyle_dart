// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: FastHomePage(children: [child]));
}

void main() {
  group('FastAlertDialog', () {
    const titleText = 'dialog';

    group('#titleText', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        var children = [Text('42')];

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final text = find.text(titleText);

        expect(text, findsOneWidget);
      });
    });

    group('#messageText', () {
      testWidgets('should draw them', (WidgetTester tester) async {
        var children = [Text('42')];

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final dialog = find.byType(FastAlertDialog);

        expect(dialog, findsOneWidget);
      });
    });

    group('#messageText', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            messageText: '42',
          )),
        );

        await tester.pumpAndSettle();

        final message = find.text('42');
        expect(message, findsOneWidget);
      });
    });

    group('#onCancel', () {
      testWidgets('should show a cancel button if this property is set',
          (WidgetTester tester) async {
        var children = [Text('42')];
        var cancel = false;

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            onCancel: () => cancel = true,
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final dialog = find.byType(FastAlertDialog);
        final cancelText = find.text(kFastCancelText);

        await tester.tap(cancelText);
        await tester.pump();

        expect(dialog, findsOneWidget);
        expect(cancelText, findsOneWidget);
        expect(cancel, isTrue);
      });
    });

    group('#onValid', () {
      testWidgets('should show a valid button if this property is set',
          (WidgetTester tester) async {
        var children = [Text('42')];
        var valid = false;

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            onValid: () => valid = true,
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final dialog = find.byType(FastAlertDialog);
        final validText = find.text(kFastValidText);

        await tester.tap(validText);
        await tester.pump();

        expect(dialog, findsOneWidget);
        expect(validText, findsOneWidget);
        expect(valid, isTrue);
      });
    });

    group('#validText', () {
      testWidgets('should be used for the valid button label',
          (WidgetTester tester) async {
        var children = [Text('42')];
        var valid = false;

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            onValid: () => valid = true,
            validText: 'ok',
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final dialog = find.byType(FastAlertDialog);
        final validText = find.text('ok');

        await tester.tap(validText);
        await tester.pump();

        expect(dialog, findsOneWidget);
        expect(validText, findsOneWidget);
        expect(valid, isTrue);
      });
    });

    group('#cancelText', () {
      testWidgets('should be used for the cancel button label',
          (WidgetTester tester) async {
        var children = [Text('42')];
        var cancel = false;

        await tester.pumpWidget(
          _buildApp(FastAlertDialog(
            titleText: titleText,
            onCancel: () => cancel = true,
            cancelText: 'nope',
            children: children,
          )),
        );

        await tester.pumpAndSettle();

        final dialog = find.byType(FastAlertDialog);
        final cancelText = find.text('nope');

        await tester.tap(cancelText);
        await tester.pump();

        expect(dialog, findsOneWidget);
        expect(cancelText, findsOneWidget);
        expect(cancel, isTrue);
      });
    });
  });
}
