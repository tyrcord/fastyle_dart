// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(
    home: Material(
      child: child,
    ),
  );
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

  group('FastListViewLayout', () {
    testWidgets('should draw its items', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(FastListViewLayout(
          items: items,
          listItemBuilder: (BuildContext context, FastItem item, int index) {
            return FastListItemLayout(labelText: item.labelText);
          },
        )),
      );

      await tester.pumpAndSettle();

      final listItems = find.byType(FastListItemLayout);
      expect(listItems, findsNWidgets(7));
    });

    group('#groupByCategory', () {
      testWidgets('should group items by categories when set to true',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
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
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            allCategoryText: 'Toutes',
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
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
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
          )),
        );

        await tester.pumpAndSettle();

        final listItems = find.byType(FastListItemLayout);
        expect(listItems, findsNWidgets(7));
      });

      testWidgets('should select a category for a given index',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            intialCategoryIndex: 1,
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
          )),
        );

        await tester.pumpAndSettle();

        final listItems = find.byType(FastListItemLayout);
        expect(listItems, findsNWidgets(3));
      });
    });

    group('#sortItems', () {
      testWidgets('should sort items by default', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            intialCategoryIndex: 1,
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
          )),
        );

        await tester.pumpAndSettle();
        final listItems = find.byType(FastListItemLayout);
        final item = tester.firstWidget(listItems) as FastListItemLayout;
        expect(listItems, findsNWidgets(3));
        expect(item.labelText, equals('apple'));
      });

      testWidgets('should not sort items when set to false',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListViewLayout(
            groupByCategory: true,
            intialCategoryIndex: 1,
            sortItems: false,
            items: items,
            listItemBuilder: (BuildContext context, FastItem item, int index) {
              return FastListItemLayout(labelText: item.labelText);
            },
          )),
        );

        await tester.pumpAndSettle();
        final listItems = find.byType(FastListItemLayout);
        final item = tester.firstWidget(listItems) as FastListItemLayout;
        expect(listItems, findsNWidgets(3));
        expect(item.labelText, equals('grappe'));
      });
    });
  });
}
