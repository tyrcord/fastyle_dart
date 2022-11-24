import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(FastOnboardingView onboarding) {
  return FastApp(
    home: onboarding,
  );
}

void main() {
  const slideText1 = 'slide 1';
  const slideText2 = 'slide 2';
  const homeText = 'Home';
  const slide1 = Text(slideText1);
  const slide2 = Text(slideText2);
  final home = FastHomePage(
    children: [
      Text(homeText),
    ],
  );

  group('FastOnboardingView', () {
    group('#slides', () {
      testWidgets('should display the first slide',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
          )),
        );
        await tester.pumpAndSettle();

        final child = find.byWidget(slide1);

        expect(child, findsOneWidget);
      });

      testWidgets('should display the second slide after tapping on next',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('NEXT'));
        await tester.pumpAndSettle();
        final child = find.byWidget(slide2);

        expect(child, findsOneWidget);
      });
    });

    group('#homeBuilder', () {
      testWidgets('should be called when the initialization is done',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              called = true;
              return home;
            },
            slides: [slide1, slide2],
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('NEXT'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('DONE'));
        await tester.pumpAndSettle();

        final child = find.byWidget(home);
        expect(child, findsOneWidget);
        expect(called, isTrue);
      });
    });

    group('#allowToSkip', () {
      testWidgets('should be set to false by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('SKIP'), findsNothing);
      });

      testWidgets('should allow to skip the onboarding view when set to true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
            allowToSkip: true,
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('SKIP'), findsOneWidget);
      });

      testWidgets(
          'should not displayed a skip option when there is only one slide',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) => home,
            slides: [slide1],
            allowToSkip: true,
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('SKIP'), findsNothing);
      });
    });

    group('#doneText', () {
      testWidgets('should allow to override the done label',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1],
            doneText: 'OK',
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('OK'), findsOneWidget);
      });
    });

    group('#nextText', () {
      testWidgets('should allow to override the next label',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
            nextText: 'CONTINUE',
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('CONTINUE'), findsOneWidget);
      });
    });

    group('#skipText', () {
      testWidgets('should allow to override the skip label',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
            allowToSkip: true,
            skipText: 'PASS',
          )),
        );
        await tester.pumpAndSettle();

        expect(find.text('PASS'), findsOneWidget);
      });
    });

    group('#onDone', () {
      testWidgets('should allow to override the done label',
          (WidgetTester tester) async {
        var done = false;

        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1],
            onDone: () => done = true,
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('DONE'));
        await tester.pumpAndSettle();

        expect(done, isTrue);
      });
    });

    group('#onSkip', () {
      testWidgets('should allow to override the done label',
          (WidgetTester tester) async {
        var skipped = false;

        await tester.pumpWidget(
          _buildApp(FastOnboardingView(
            homeBuilder: (_) {
              return home;
            },
            slides: [slide1, slide2],
            allowToSkip: true,
            onSkip: () => skipped = true,
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('SKIP'));
        await tester.pumpAndSettle();

        expect(skipped, isTrue);
      });
    });
  });
}
