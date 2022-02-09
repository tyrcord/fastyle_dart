import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp() {
  return FastApp(home: Container());
}

void main() {
  group('FastNotificationCenter', () {
    final infoIconKey = Key('info');
    final successIconKey = Key('info');
    final warnIconKey = Key('info');
    final errorIconKey = Key('info');
    final infoIcon = Icon(Icons.message, key: infoIconKey);
    final successIcon = Icon(Icons.message, key: successIconKey);
    final warnIcon = Icon(Icons.message, key: warnIconKey);
    final errorIcon = Icon(Icons.message, key: errorIconKey);

    testWidgets(
      '#info() should display an notification popup',
      (WidgetTester tester) async {
        await tester.pumpWidget(_buildApp());
        await tester.pump(Duration(milliseconds: 100));

        FastNotificationCenter.info(
          'info message',
          options: FastNotificationCenterOptions(
            leadingIcon: infoIcon,
          ),
        );

        tester.binding.scheduleWarmUpFrame();
        await tester.pump(Duration(milliseconds: 200));

        final icon = find.byKey(infoIconKey);
        final text = find.text('info message');

        expect(icon, findsOneWidget);
        expect(text, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      '#warn() should display an notification popup',
      (WidgetTester tester) async {
        await tester.pumpWidget(_buildApp());
        await tester.pump(Duration(milliseconds: 100));

        FastNotificationCenter.warn(
          'warn message',
          options: FastNotificationCenterOptions(
            leadingIcon: warnIcon,
          ),
        );

        tester.binding.scheduleWarmUpFrame();
        await tester.pump(Duration(milliseconds: 200));

        final icon = find.byKey(warnIconKey);
        final text = find.text('warn message');

        expect(icon, findsOneWidget);
        expect(text, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      '#error() should display an notification popup',
      (WidgetTester tester) async {
        await tester.pumpWidget(_buildApp());
        await tester.pump(Duration(milliseconds: 100));

        FastNotificationCenter.error(
          'error message',
          options: FastNotificationCenterOptions(
            leadingIcon: errorIcon,
          ),
        );

        tester.binding.scheduleWarmUpFrame();
        await tester.pump(Duration(milliseconds: 200));

        final icon = find.byKey(errorIconKey);
        final text = find.text('error message');

        expect(icon, findsOneWidget);
        expect(text, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      '#success() should display an notification popup',
      (WidgetTester tester) async {
        await tester.pumpWidget(_buildApp());
        await tester.pump(Duration(milliseconds: 100));

        FastNotificationCenter.success(
          'success message',
          options: FastNotificationCenterOptions(
            leadingIcon: successIcon,
          ),
        );

        tester.binding.scheduleWarmUpFrame();
        await tester.pump(Duration(milliseconds: 200));

        final icon = find.byKey(successIconKey);
        final text = find.text('success message');

        expect(icon, findsOneWidget);
        expect(text, findsOneWidget);

        await tester.pumpAndSettle();
      },
    );

    // FIXME: test are broken with flutter 2.10.0 & another_flushbar ^1.10.28
    // Wait from them to fix it.
    // testWidgets(
    //   'notifications should be displayed in order',
    //   (WidgetTester tester) async {
    //     await tester.pumpWidget(_buildApp());
    //     await tester.pump(Duration(milliseconds: 100));

    //     FastNotificationCenter.info(
    //       'info message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: infoIcon,
    //       ),
    //     );

    //     FastNotificationCenter.success(
    //       'success message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: successIcon,
    //       ),
    //     );

    //     tester.binding.scheduleWarmUpFrame();
    //     await tester.pump(Duration(milliseconds: 200));

    //     final icon = find.byKey(infoIconKey);
    //     final text = find.text('info message');

    //     expect(icon, findsOneWidget);
    //     expect(text, findsOneWidget);

    //     tester.binding.scheduleWarmUpFrame();
    //     await tester.pump(Duration(milliseconds: 650 + 2000 + 750 + 100));

    //     final icon2 = find.byKey(successIconKey);
    //     final text2 = find.text('success message');

    //     expect(icon2, findsOneWidget);
    //     expect(text2, findsOneWidget);

    //     await tester.pumpAndSettle();
    //   },
    // );

    // testWidgets(
    //   'notifications should only keep two notification in the queue',
    //   (WidgetTester tester) async {
    //     await tester.pumpWidget(_buildApp());
    //     await tester.pump(Duration(milliseconds: 100));

    //     FastNotificationCenter.info(
    //       'info message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: infoIcon,
    //       ),
    //     );

    //     FastNotificationCenter.error(
    //       'error message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: errorIcon,
    //       ),
    //     );

    //     FastNotificationCenter.error(
    //       'warn message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: warnIcon,
    //       ),
    //     );

    //     FastNotificationCenter.success(
    //       'success message',
    //       options: FastNotificationCenterOptions(
    //         leadingIcon: successIcon,
    //       ),
    //     );

    //     tester.binding.scheduleWarmUpFrame();
    //     await tester.pump(Duration(milliseconds: 100));

    //     final icon = find.byKey(infoIconKey);
    //     final text = find.text('info message');

    //     expect(icon, findsOneWidget);
    //     expect(text, findsOneWidget);

    //     tester.binding.scheduleWarmUpFrame();
    //     await tester.pump(Duration(milliseconds: 650 + 2000 + 750 + 100));

    //     final icon2 = find.byKey(warnIconKey);
    //     final text2 = find.text('warn message');

    //     expect(icon2, findsOneWidget);
    //     expect(text2, findsOneWidget);

    //     await tester.pumpAndSettle();
    //   },
    // );
  });
}
