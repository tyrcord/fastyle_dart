// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(
      home: FastSectionPage(
    child: child,
  ));
}

void main() {
  const items = [
    FastItem(labelText: '1'),
    FastItem(labelText: '0'),
    FastItem(labelText: '2'),
    FastItem(labelText: '4'),
    FastItem(labelText: 'grappe'),
    FastItem(labelText: 'apple'),
    FastItem(labelText: 'banana'),
  ];

  group('FastSearchBar', () {
    group('#onSuggestions()', () {
      testWidgets('should be called when the search query is not empty',
          (WidgetTester tester) async {
        var called = false;
        var controller = TextEditingController();
        var suggestions;
        var searchQuery;

        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            textEditingController: controller,
            onSuggestions: (List<FastItem<dynamic>>? items, String? query) {
              called = true;
              suggestions = items;
              searchQuery = query;
            },
          )),
        );
        await tester.pumpAndSettle();
        controller.value = TextEditingValue(text: 'ap');

        expect(called, isTrue);
        expect(searchQuery, equals('ap'));
        expect(
          suggestions.map((e) => e.labelText),
          containsAll(['apple', 'grappe']),
        );
      });
    });

    group('#onSearchFilter()', () {
      testWidgets('should be called when the search query is not empty',
          (WidgetTester tester) async {
        var called = false;
        var controller = TextEditingController();
        List<FastItem<dynamic>>? suggestions;
        var searchQuery;

        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            textEditingController: controller,
            onSearchFilter: (FastItem option, String? query) {
              called = true;
              return option.labelText == 'apple';
            },
            onSuggestions: (List<FastItem<dynamic>>? items, String? query) {
              suggestions = items;
              searchQuery = query;
            },
          )),
        );
        await tester.pumpAndSettle();
        controller.value = TextEditingValue(text: 'ap');

        expect(called, isTrue);
        expect(searchQuery, equals('ap'));
        expect(suggestions!.length, equals(1));
        expect(
          suggestions!.map((e) => e.labelText),
          containsAll(['apple']),
        );
      });
    });

    group('#placeholderText', () {
      testWidgets('should allow to set the search placeholder text',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            placeholderText: 'Search',
          )),
        );
        await tester.pumpAndSettle();

        final searchField =
            tester.firstWidget(find.byType(FastSearchField)) as FastSearchField;
        expect(find.byType(FastSearchField), findsOneWidget);
        expect(searchField.placeholderText, 'Search');
      });
    });

    group('#onLeadingButtonTap()', () {
      testWidgets('should be called when a user tap on the leading button',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            onLeadingButtonTap: () => called = true,
            placeholderText: 'Search',
          )),
        );
        await tester.pumpAndSettle();

        var finder = find.byWidget(kFastBackIcon);

        await tester.tap(finder);
        await tester.pumpAndSettle();

        expect(called, isTrue);
      });
    });

    group('#showLeadingIcon', () {
      testWidgets('should be set to true by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
          )),
        );
        await tester.pumpAndSettle();
        var finder = find.byWidget(kFastBackIcon);

        expect(finder, findsOneWidget);
      });

      testWidgets('should not draw the leading icon when to false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            showLeadingIcon: false,
          )),
          Duration(milliseconds: 60),
        );

        var finder = find.byWidget(kFastBackIcon);

        expect(finder, findsNothing);
      });
    });

    group('#clearSearchIcon', () {
      testWidgets('should draw it', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSearchBar(
            items: items,
            clearSearchIcon: kFastDoneIcon,
          )),
        );
        await tester.pumpAndSettle();

        expect(find.byWidget(kFastDoneIcon), findsOneWidget);
      });
    });
  });
}
