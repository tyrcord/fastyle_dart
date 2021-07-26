import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: Material(child: child));
}

void main() {
  const numbersCategory = FastCategory(
    labelText: 'Numbers',
    valueText: 'numbers',
    weight: 1,
  );
  const fruitsCategory = FastCategory(
    labelText: 'Fruits',
    valueText: 'fruit',
    weight: 2,
  );
  const items = [
    FastItem(labelText: '1', categories: [numbersCategory]),
    FastItem(labelText: '0', categories: [numbersCategory]),
    FastItem(labelText: '2', categories: [numbersCategory]),
    FastItem(labelText: '4', categories: [numbersCategory]),
    FastItem(labelText: 'grappe', categories: [fruitsCategory]),
    FastItem(labelText: 'apple', categories: [fruitsCategory]),
    FastItem(labelText: 'banana', categories: [fruitsCategory]),
  ];

  const categories = [numbersCategory, fruitsCategory];
  group('FastSelectableListView', () {
    group('#items', () {
      testWidgets('should draw its items', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
          )),
        );
        await tester.pumpAndSettle();
        final listItems = find.byType(FastSelectableListItem);
        expect(listItems, findsNWidgets(7));
      });
    });

    group('#onSelectionChanged()', () {
      testWidgets('should be called when an item is selected',
          (WidgetTester tester) async {
        var called = false;
        var selection;

        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {
              called = true;
              selection = item;
            },
          )),
        );
        await tester.pumpAndSettle();

        final listItems = find.byType(FastSelectableListItem);
        await tester.tap(listItems.first);
        await tester.pumpAndSettle();

        var found = tester.firstWidget(listItems) as FastSelectableListItem;

        expect(called, isTrue);
        expect(selection.labelText, equals(found.item!.labelText));
      });
    });

    group('#listItemBuilder', () {
      testWidgets('should be used for building items',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastLink(text: item.labelText, onTap: () {});
            },
          )),
        );
        await tester.pumpAndSettle();

        final listItems = find.byType(FastLink);
        expect(listItems, findsNWidgets(7));
      });
    });

    group('#groupByCategory', () {
      testWidgets('should group items by categories when set to true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            categories: categories,
            groupByCategory: true,
          )),
        );
        await tester.pumpAndSettle();

        final allText = find.text('All');
        final fruitsText = find.text('Fruits');
        final numbersText = find.text('Numbers');

        expect(allText, findsOneWidget);
        expect(fruitsText, findsOneWidget);
        expect(numbersText, findsOneWidget);
      });
    });

    group('#allCategoryText', () {
      testWidgets('should be used for the "All" category',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            onSelectionChanged: (FastItem item) {},
            categories: categories,
            groupByCategory: true,
            allCategoryText: 'Toutes',
            items: items,
          )),
        );
        await tester.pumpAndSettle();

        final allText = find.text('Toutes');
        final fruitsText = find.text('Fruits');
        final numbersText = find.text('Numbers');
        expect(allText, findsOneWidget);
        expect(fruitsText, findsOneWidget);
        expect(numbersText, findsOneWidget);
      });
    });

    group('#intialCategoryIndex', () {
      testWidgets('The "All" category should be selected by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            onSelectionChanged: (FastItem item) {},
            categories: categories,
            groupByCategory: true,
            items: items,
          )),
        );
        await tester.pumpAndSettle();

        final listItems = find.byType(FastListItemLayout);
        expect(listItems, findsNWidgets(7));
      });

      testWidgets('should select a category for a given index',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            onSelectionChanged: (FastItem item) {},
            categories: categories,
            groupByCategory: true,
            intialCategoryIndex: 1,
            items: items,
          )),
        );
        await tester.pumpAndSettle();

        final listItems = find.byType(FastListItemLayout);
        expect(listItems, findsNWidgets(3));
      });
    });

    group('#isEnabled', () {
      testWidgets('should be set to true by default',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            onSelectionChanged: (FastItem item) => called = true,
            categories: categories,
            groupByCategory: true,
            intialCategoryIndex: 1,
            items: items,
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(FastSelectableListItem).first);
        await tester.pumpAndSettle();

        expect(called, isTrue);
      });

      testWidgets('should not allow to use the switch toggle when set to false',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            onSelectionChanged: (FastItem item) => called = true,
            categories: categories,
            groupByCategory: true,
            intialCategoryIndex: 1,
            items: items,
            isEnabled: false,
          )),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byType(FastSelectableListItem).first);
        await tester.pumpAndSettle();

        expect(called, isFalse);
      });
    });

    group('#sortItems', () {
      testWidgets('should sort items by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
          )),
        );
        await tester.pumpAndSettle();
        final listItems = find.byType(FastSelectableListItem);
        final selection =
            tester.firstWidget(listItems) as FastSelectableListItem;
        expect(listItems, findsNWidgets(7));
        expect(selection.item!.labelText, equals('0'));
      });

      testWidgets('should not sort items when set to false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastSelectableListView(
            items: items,
            onSelectionChanged: (FastItem item) {},
            sortItems: false,
          )),
        );
        await tester.pumpAndSettle();
        final listItems = find.byType(FastSelectableListItem);
        final selection =
            tester.firstWidget(listItems) as FastSelectableListItem;
        expect(listItems, findsNWidgets(7));
        expect(selection.item!.labelText, equals('1'));
      });
    });
  });
}
