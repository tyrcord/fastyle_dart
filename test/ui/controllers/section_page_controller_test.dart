import 'package:flutter_test/flutter_test.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const _kLoaded = 'LOADED';
const _kLoading = 'LOADING';
const _kError = 'ERROR';

FastApp _buildApp({
  Future<bool>? loadingFuture,
  Duration? loadingTimeout,
}) {
  return FastApp(
    home: FastSectionPageController(
      loadingBuilder: (context) => FastBody(text: _kLoading),
      loadedBuilder: (context) => FastBody(text: _kLoaded),
      errorBuilder: (context) => FastBody(text: _kError),
      loadingTimeout: loadingTimeout,
      loadingFuture: loadingFuture,
    ),
  );
}

void main() {
  testWidgets(
    'FastSectionPageController should use contentBuilder by default',
    (WidgetTester tester) async {
      await tester.pumpWidget(_buildApp(), Duration(milliseconds: 60));

      final text = find.text(_kLoaded);
      expect(text, findsOneWidget);
    },
  );

  testWidgets(
    'FastSectionPageController should use contentBuilder '
    'once content is loaded',
    (WidgetTester tester) async {
      await tester.pumpWidget(_buildApp(
        loadingFuture: Future.delayed(
          const Duration(milliseconds: 80),
          () => true,
        ),
      ));

      await tester.pump(Duration(milliseconds: 100));

      final text = find.text(_kLoaded);
      expect(text, findsOneWidget);
    },
  );

  testWidgets(
    'FastSectionPageController should use errorBuilder '
    'once content has failed to load',
    (WidgetTester tester) async {
      await tester.pumpWidget(_buildApp(
        loadingFuture: Future.delayed(
          const Duration(milliseconds: 80),
          () => throw _kError,
        ),
      ));

      await tester.pump(Duration(milliseconds: 100));

      final text = find.text(_kError);
      expect(text, findsOneWidget);
    },
  );

  testWidgets(
    'FastSectionPageController should use errorBuilder '
    'once load timeout occurred',
    (WidgetTester tester) async {
      await tester.pumpWidget(_buildApp(
        loadingFuture: Future.delayed(
          const Duration(milliseconds: 120),
          () => throw _kError,
        ),
        loadingTimeout: Duration(milliseconds: 60),
      ));

      await tester.pump(Duration(milliseconds: 80));

      final text = find.text(_kError);
      expect(text, findsOneWidget);

      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'FastSectionPageController should use loadingBuilder when loading',
    (WidgetTester tester) async {
      await tester.pumpWidget(_buildApp(
        loadingFuture: Future.delayed(
          const Duration(milliseconds: 80),
          () => true,
        ),
      ));

      await tester.pump(Duration(milliseconds: 60));

      final text = find.text(_kLoading);
      expect(text, findsOneWidget);

      await tester.pump(Duration(milliseconds: 40));

      final loadedText = find.text(_kLoaded);
      expect(loadedText, findsOneWidget);
    },
  );
}
