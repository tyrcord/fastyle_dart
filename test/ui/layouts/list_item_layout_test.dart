import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

FastApp _buildApp(Widget child) {
  return FastApp(home: Material(child: child));
}

void main() {
  const itemText = 'item';
  const itemTextCapitalized = 'Item';
  final trailing = Text('trailing');
  final leading = Text('leading');
  final trailing2 = Text('trailing2');
  final leading2 = Text('leading2');

  group('FastShadowLayout', () {
    group('#labelText', () {
      testWidgets('should be drawn and capitalized by default',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
          )),
        );

        await tester.pumpAndSettle();

        final text = find.text(itemTextCapitalized);
        expect(text, findsOneWidget);
      });
    });

    group('#descriptionText', () {
      testWidgets('should be drawn when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            descriptionText: 'description',
          )),
        );

        await tester.pumpAndSettle();

        final text = find.text('description');
        expect(text, findsOneWidget);
      });
    });

    group('#leading', () {
      testWidgets('should be drawn when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            leading: leading,
          )),
        );

        await tester.pumpAndSettle();

        final widget = find.byWidget(leading);
        expect(widget, findsOneWidget);
      });
    });

    group('#trailing', () {
      testWidgets('should be drawn when set', (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            trailing: trailing,
          )),
        );

        await tester.pumpAndSettle();
        final widget = find.byWidget(trailing);
        expect(widget, findsOneWidget);
      });
    });

    group('#onTap()', () {
      testWidgets('should be called when a tap gesture occured',
          (WidgetTester tester) async {
        var tapped = false;

        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            onTap: () => tapped = true,
          )),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byType(FastListItemLayout));
        expect(tapped, isTrue);
      });
    });

    group('#isEnabled', () {
      testWidgets('should not call onTap when a tap gesture occured',
          (WidgetTester tester) async {
        var tapped = false;

        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            onTap: () => tapped = true,
            isEnabled: false,
          )),
        );

        await tester.pumpAndSettle();
        await tester.tap(find.byType(FastListItemLayout));
        expect(tapped, isFalse);
      });
    });

    group('#descriptor', () {
      testWidgets('should be used for setting the leading property',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            descriptor: FastListItemDescriptor(leading: leading),
          )),
        );

        await tester.pumpAndSettle();
        final widget = find.byWidget(leading);
        expect(widget, findsOneWidget);
      });

      testWidgets('should override leading property',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            leading: leading,
            descriptor: FastListItemDescriptor(leading: leading2),
          )),
        );

        await tester.pumpAndSettle();

        final widget = find.byWidget(leading2);
        expect(widget, findsOneWidget);
      });

      testWidgets('should be used for setting the trailing property',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            descriptor: FastListItemDescriptor(trailing: trailing),
          )),
        );

        await tester.pumpAndSettle();
        final widget = find.byWidget(trailing);
        expect(widget, findsOneWidget);
      });

      testWidgets('should override trailing property',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          _buildApp(FastListItemLayout(
            labelText: itemText,
            trailing: trailing,
            descriptor: FastListItemDescriptor(trailing: trailing2),
          )),
        );

        await tester.pumpAndSettle();
        final widget = find.byWidget(trailing2);
        expect(widget, findsOneWidget);
      });
    });
  });
}
