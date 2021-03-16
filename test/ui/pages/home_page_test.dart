import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(FastHomePage home) {
  return FastApp(home: home);
}

void main() {
  const content1 = 'content1';
  const content2 = 'content2';
  const child1 = Text(content1);
  const child2 = Text(content2);

  group('FastHomePage', () {
    group('children', () {
      testWidgets('should draw them', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastHomePage(
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        final child1Widget = find.byWidget(child1);
        final child2Widget = find.byWidget(child2);

        expect(child1Widget, findsOneWidget);
        expect(child2Widget, findsOneWidget);
      });
    });

    group('floatingActionButton', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastHomePage(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
            ),
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        final fab = find.byType(FloatingActionButton);
        expect(fab, findsOneWidget);
      });
    });

    group('subtitleText', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastHomePage(
            subtitleText: 'subtitle',
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        final text = find.text('subtitle');
        expect(text, findsOneWidget);
      });
    });

    group('titleText', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastHomePage(
            titleText: 'title',
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        final text = find.text('title');
        expect(text, findsOneWidget);
      });
    });

    group('expandedHeight', () {
      testWidgets('should set the size of the app bar',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastHomePage(
            expandedHeight: 200,
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        final size = tester.getSize(find.byType(FlexibleSpaceBar));
        expect(size.height, equals(200));
      });
    });

    group('leading', () {
      testWidgets('should draw them', (WidgetTester tester) async {
        var icon = Icon(Icons.access_alarm);

        await tester.pumpWidget(
          _buildApp(FastHomePage(
            leading: icon,
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byWidget(icon), findsOneWidget);
      });
    });

    group('actions', () {
      testWidgets('should draw them', (WidgetTester tester) async {
        var icon = Icon(Icons.access_alarm);

        await tester.pumpWidget(
          _buildApp(FastHomePage(
            actions: [icon],
            children: [child1, child2],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byWidget(icon), findsOneWidget);
      });
    });
  });
}
