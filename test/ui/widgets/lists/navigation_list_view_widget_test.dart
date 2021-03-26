import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: Material(child: child));
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

  group('FastNavigationListView', () {
    group('#items', () {
      testWidgets('should draw its items', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
          )),
          Duration(milliseconds: 60),
        );

        final listItems = find.byType(FastListItemLayout);
        expect(listItems, findsNWidgets(7));
      });
    });

    group('#onSelectionChanged()', () {
      testWidgets('should be called when an item is selected',
          (WidgetTester tester) async {
        var called = false;
        var selection;

        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {
              called = true;
              selection = item;
            },
          )),
          Duration(milliseconds: 60),
        );

        final listItems = find.byType(FastListItemLayout);
        await tester.tap(listItems.first);
        await tester.pumpAndSettle();

        var found = tester.firstWidget(listItems) as FastListItemLayout;

        expect(called, isTrue);
        expect(selection.labelText, equals(found.labelText));
      });
    });

    group('#showSearchBar', () {
      testWidgets('should be set to false by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byType(FastSearchBar), findsNothing);
      });

      testWidgets('should displayed a search bar when set to true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            showSearchBar: true,
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byType(FastSearchBar), findsOneWidget);
      });
    });

    group('#listItemBuilder', () {
      testWidgets('should be used for building items',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastLink(text: item.labelText, onTap: () {});
            },
          )),
          Duration(milliseconds: 60),
        );

        final listItems = find.byType(FastLink);
        expect(listItems, findsNWidgets(7));
      });
    });

    group('#searchPlaceholderText', () {
      testWidgets('should allow to set the search placeholder text',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            onSelectionChanged: (FastItem item) {},
            items: items,
            searchPlaceholderText: 'Recherche',
            showSearchBar: true,
          )),
          Duration(milliseconds: 60),
        );

        final searchField =
            tester.firstWidget(find.byType(FastSearchField)) as FastSearchField;
        expect(find.byType(FastSearchField), findsOneWidget);
        expect(searchField.placeholderText, 'Recherche');
      });
    });

    group('#sortItems', () {
      testWidgets('should sort items by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
          )),
          Duration(milliseconds: 60),
        );
        final listItems = find.byType(FastListItemLayout);
        final item = tester.firstWidget(listItems) as FastListItemLayout;
        expect(listItems, findsNWidgets(7));
        expect(item.labelText, equals('0'));
      });

      testWidgets('should not sort items when set to false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastNavigationListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            sortItems: false,
          )),
          Duration(milliseconds: 60),
        );
        final listItems = find.byType(FastListItemLayout);
        final item = tester.firstWidget(listItems) as FastListItemLayout;
        expect(listItems, findsNWidgets(7));
        expect(item.labelText, equals('1'));
      });
    });
  });
}
