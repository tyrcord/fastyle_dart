// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(FastSectionPage home) {
  return FastApp(home: home);
}

void main() {
  const content1 = 'content1';
  const content2 = 'content2';
  const child1 = Text(content1);
  const child2 = Text(content2);

  group('FastSectionPage', () {
    group('#child', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        final child1Widget = find.byWidget(child1);
        expect(child1Widget, findsOneWidget);
      });
    });

    group('#contentBuilder', () {
      testWidgets('should be called to build the content of the page',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            contentBuilder: (_) {
              return child2;
            },
          )),
        );

        await tester.pumpAndSettle();

        final child2Widget = find.byWidget(child2);
        expect(child2Widget, findsOneWidget);
      });
    });

    group('#footerBuilder', () {
      testWidgets('should be called to build the footer of the page',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            footerBuilder: (_) => Text('footer'),
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        expect(find.text('footer'), findsOneWidget);
      });
    });

    group('#floatingActionButton', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
            ),
            child: child1,
          )),
        );

        await tester.pumpAndSettle();
        final fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
      });
    });

    group('#leading', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        var icon = Icon(Icons.access_alarm);

        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            leading: icon,
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        expect(find.byWidget(icon), findsOneWidget);
      });
    });

    group('#actions', () {
      testWidgets('should draw them', (WidgetTester tester) async {
        var icon = Icon(Icons.access_alarm);

        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            actions: [icon],
            child: child1,
          )),
        );

        await tester.pumpAndSettle();
        expect(find.byWidget(icon), findsOneWidget);
      });
    });

    group('#footer', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        var key = Key('test');

        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            footer: Container(key: key),
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(key), findsOneWidget);
      });
    });

    group('#titleText', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            titleText: 'title',
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        expect(find.text('title'), findsOneWidget);
      });
    });

    group('#loadingBuilder', () {
      testWidgets('should be used when the page is loading',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            loadingBuilder: (_) => Text('loading'),
            loadingFuture: Future.delayed(
              const Duration(milliseconds: 600),
              () => true,
            ),
            child: child1,
          )),
        );

        await tester.pumpAndSettle();

        final text = find.text('loading');
        expect(text, findsOneWidget);

        await tester.pumpAndSettle(const Duration(milliseconds: 600));

        final child1Widget = find.byWidget(child1);
        expect(child1Widget, findsOneWidget);
      });
    });

    group('#loadingTimeout', () {
      testWidgets(
          'should use errorBuilder '
          'when the page is taking too much time to load',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSectionPage(
            loadingBuilder: (_) => Text('loading'),
            errorBuilder: (_) => Text('error'),
            loadingFuture: Future.delayed(
              const Duration(milliseconds: 2500),
              () => true,
            ),
            loadingTimeout: Duration(milliseconds: 300),
            child: child1,
          )),
        );

        await tester.pumpAndSettle(Duration(milliseconds: 600));

        final text = find.text('error');
        expect(text, findsOneWidget);

        await tester.pumpAndSettle(const Duration(milliseconds: 2500));
      });
    });
  });
}
