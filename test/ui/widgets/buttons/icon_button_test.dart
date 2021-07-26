import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: FastHomePage(children: [child]));
}

void main() {
  group('FastIconButton', () {
    const pageviewIcon = Icon(Icons.pageview);

    testWidgets('should draw its icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastIconButton(
          icon: pageviewIcon,
          onTap: () {},
        )),
      );

      await tester.pumpAndSettle();

      final button = find.byType(FastIconButton);
      final icon = find.byWidget(pageviewIcon);

      expect(button, findsOneWidget);
      expect(icon, findsOneWidget);
    });

    testWidgets('should react to user interactions',
        (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        _buildApp(FastIconButton(
          icon: pageviewIcon,
          onTap: () {
            tapped = true;
          },
        )),
      );

      await tester.pumpAndSettle();

      final button = find.byType(FastIconButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('should react to user interactions if disabled',
        (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        _buildApp(FastIconButton(
          icon: pageviewIcon,
          onTap: () {
            tapped = true;
          },
          isEnabled: false,
        )),
      );

      await tester.pumpAndSettle();

      final button = find.byType(FastIconButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('should should trottle time if required',
        (WidgetTester tester) async {
      var count = 0;

      await tester.pumpWidget(
        _buildApp(FastIconButton(
          icon: pageviewIcon,
          onTap: () {
            count++;
          },
          shouldTrottleTime: true,
        )),
      );

      await tester.pumpAndSettle();

      final button = find.byType(FastIconButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pump();
      await tester.tap(button);
      await tester.pump();

      expect(count, equals(1));
    });

    testWidgets('should should trottle time for a certain amount of time',
        (WidgetTester tester) async {
      var count = 0;

      await tester.pumpWidget(
        _buildApp(FastIconButton(
          icon: pageviewIcon,
          onTap: () {
            count++;
          },
          shouldTrottleTime: true,
          trottleTimeDuration: Duration(milliseconds: 500),
        )),
      );
      await tester.pumpAndSettle();

      final button = find.byType(FastIconButton);
      expect(button, findsOneWidget);

      await tester.tap(button);
      await tester.pump();
      await tester.tap(button);
      await tester.pump(Duration(milliseconds: 500));
      await tester.tap(button);
      await tester.pump();

      expect(count, equals(2));
    });
  });
}
