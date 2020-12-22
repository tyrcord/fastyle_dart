import 'dart:developer';

import 'package:fastyle_dart_example/data/items.dart';
import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class FieldsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return FastSectionPage(
      titleText: 'Fields',
      isViewScrollable: true,
      child: Column(
        children: [
          FastListHeader(
            categoryText: 'category 1',
            categoryColor: primaryColor,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(bottom: 16.0),
          ),
          FastNumberField(
            labelText: 'Number 1',
            placeholderText: '0',
            captionText: 'required',
          ),
          FastTextField(
            labelText: 'Text 1',
            helperText: 'Do you need some help?',
          ),
          FastNumberField(
            labelText: 'Number 2',
            placeholderText: '1000',
            captionText: 'optional',
          ),
          FastSegmentField(
            labelText: 'Position',
            options: [
              FastItem(
                labelText: 'Long',
                value: 'long',
              ),
              FastItem(
                labelText: 'Short',
                value: 'short',
              ),
            ],
            onValueChanged: (option) {
              log(option.value.toString());
            },
          ),
          FastNumberField(
            labelText: 'Number 3',
            placeholderText: '42',
            captionText: 'optional',
          ),
          FastNumberField(
            labelText: 'Number with a suffix icon',
            placeholderText: '0',
            suffixIcon: Container(
              child: PopupMenuButton(
                itemBuilder: (context) => <PopupMenuItem>[
                  PopupMenuItem(child: Text('Option 1'), value: 1),
                  PopupMenuItem(child: Text('Option 2'), value: 2),
                ],
                padding: EdgeInsets.zero,
                icon: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.more_vert,
                    size: kFastIconSize,
                    color: ThemeHelper.texts.getBodyTextStyle(context).color,
                  ),
                ),
              ),
            ),
          ),
          FastListHeader(
            categoryText: 'category 2',
            categoryColor: primaryColor,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(bottom: 16.0),
          ),
          FastNumberField(
            labelText: 'Number 3',
            placeholderText: '100',
            captionText: 'required',
          ),
          FastSelectField(
            labelText: 'Favorite food',
            items: demoItems,
            shouldGroupByCategory: true,
            selection: demoItems[3],
            categories: demoCategories,
            onSelectionChanged: (FastItem<String> value) {},
          ),
          FastTextField(
            labelText: 'Text 2',
            placeholderText: 'value',
            captionText: 'optional',
          ),
          FastReadOnlyTextField(
            labelText: 'Read Only',
            valueText: 'Can select text',
          ),
          FastPendingReadOnlyTextField(
            labelText: 'Pending Read Only',
            valueText: 'Pending',
            pendingText: '\$0.000',
          ),
        ],
      ),
    );
  }
}
