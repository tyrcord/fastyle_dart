import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(
      home: FastHomePage(
    children: [child],
  ));
}

void main() {
  const labelText = 'label';
  const descriptionText = 'description';
  const itemIcon = Icon(Icons.icecream);
  const trailingIcon = Icon(Icons.radio);

  const item = FastItem(
    labelText: 'label 2',
    descriptionText: 'description 2',
    isEnabled: false,
    descriptor: FastListItemDescriptor(
      leading: itemIcon,
      trailing: trailingIcon,
    ),
  );

  group('FastSelectableListItem', () {
    group('#onTap()', () {
      testWidgets('should be called when the toggle switch is used',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () => called = true,
                labelText: labelText,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        await tester.tap(find.byType(FastSelectableListItem));
        await tester.pumpAndSettle();

        expect(called, isTrue);
      });
    });

    group('#isSelected', () {
      testWidgets('should be set to false by default',
          (WidgetTester tester) async {
        var item = FastSelectableListItem(
          onTap: () {},
          labelText: labelText,
        );

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              item,
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(item.isSelected, isFalse);
      });
    });

    group('#isEnabled', () {
      testWidgets('should be set to true by default',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () => called = true,
                labelText: labelText,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        await tester.tap(find.byType(FastSelectableListItem));
        await tester.pumpAndSettle();

        expect(called, isTrue);
      });

      testWidgets('should not allow to use the switch toggle when set to false',
          (WidgetTester tester) async {
        var called = false;

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () => called = true,
                labelText: labelText,
                isEnabled: false,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        await tester.tap(find.byType(FastSelectableListItem));
        await tester.pumpAndSettle();

        expect(called, isFalse);
      });
    });

    group('#titleText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                capitalizeLabelText: false,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.text(labelText), findsOneWidget);
      });
    });

    group('#descriptionText', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.text(descriptionText), findsOneWidget);
      });
    });

    group('#leading', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                leading: icon,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byWidget(icon), findsOneWidget);
      });
    });

    group('#trailing', () {
      testWidgets('should draw it when set', (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                trailing: icon,
                isSelected: true,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(
          find.widgetWithIcon(FastSelectableListItem, Icons.pages),
          findsOneWidget,
        );
      });
    });

    group('#item', () {
      testWidgets('should be used when titleText is set',
          (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                capitalizeLabelText: false,
                leading: icon,
                item: item,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.text(item.labelText), findsOneWidget);
      });

      testWidgets('should be used when descriptionText is set',
          (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                leading: icon,
                item: item,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.text(item.descriptionText!), findsOneWidget);
      });

      testWidgets('should be used when isEnabled is set',
          (WidgetTester tester) async {
        final icon = Icon(Icons.pages);
        var called = false;

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () => called = true,
                labelText: labelText,
                descriptionText: descriptionText,
                leading: icon,
                item: item,
                isEnabled: true,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        await tester.tap(find.byType(FastSelectableListItem));
        await tester.pumpAndSettle();

        expect(called, isFalse);
      });

      testWidgets('should be used when descriptor\'s leading is set',
          (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                leading: icon,
                item: item,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(find.byWidget(itemIcon), findsOneWidget);
      });

      testWidgets('should be used when descriptor\'s trailing is set',
          (WidgetTester tester) async {
        final icon = Icon(Icons.pages);

        await tester.pumpWidget(
          _buildApp(Column(
            children: [
              FastSelectableListItem(
                onTap: () {},
                labelText: labelText,
                descriptionText: descriptionText,
                trailing: icon,
                isSelected: true,
                item: item,
              ),
            ],
          )),
          Duration(milliseconds: 60),
        );

        expect(
          find.widgetWithIcon(FastSelectableListItem, Icons.radio),
          findsOneWidget,
        );
      });
    });
  });
}
