import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:fastyle_dart_example/main.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding();

  testWidgets('screenshot', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    String platformName = '';

    if (!kIsWeb) {
      // Not required for the web. This is required prior to taking the screenshot.
      await binding.convertFlutterSurfaceToImage();

      if (Platform.isAndroid) {
        platformName = "android";
      } else {
        platformName = "ios";
      }
    } else {
      platformName = "web";
    }

    await tester.pumpAndSettle(const Duration(seconds: 15));
    // Take the screenshot
    await binding.takeScreenshot('screenshot-$platformName');
  });
}
