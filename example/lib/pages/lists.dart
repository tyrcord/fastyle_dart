import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fastyle_dart/fastyle_dart.dart';

class ListsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final options = [
      FastItem(label: 'Option 1', value: 1),
      FastItem(label: 'Option 2', value: 2),
      FastItem(label: 'Option 3', value: 3),
    ];

    final optionWithDescriptions = [
      FastItem(
        label: 'Option 1',
        value: 1,
        description: 'Description 1',
      ),
      FastItem(
        label: 'Option 2',
        value: 2,
        description: 'Description 2',
      ),
      FastItem(
        label: 'Option 3',
        value: 3,
        description: 'Description 3',
      ),
    ];

    return FastSectionPage(
      isViewScrollable: true,
      titleText: 'Lists',
      contentPadding: EdgeInsets.zero,
      child: Column(
        children: [
          FastListHeader(
            categoryText: 'No Option selected',
          ),
          FastSelectableListView(
            isViewScrollable: false,
            items: options,
            onSelectionChanged: (FastItem option) {
              log('${option.label} selected');
            },
          ),
          FastListHeader(
            categoryText: 'Default Option Selected',
            captionText: 'caption',
          ),
          FastSelectableListView(
            isViewScrollable: false,
            items: options,
            selection: options.first,
            onSelectionChanged: (FastItem option) {
              log('${option.label} selected');
            },
          ),
          FastListHeader(
            categoryText: 'Options with descriptions',
          ),
          FastSelectableListView(
            isViewScrollable: false,
            items: optionWithDescriptions,
            selection: optionWithDescriptions[2],
            onSelectionChanged: (FastItem option) {
              log('${option.label} selected');
            },
          ),
          FastListHeader(
            categoryText: 'Options with dividers',
          ),
          FastSelectableListView(
            showItemDivider: true,
            isViewScrollable: false,
            items: optionWithDescriptions,
            selection: optionWithDescriptions[2],
            onSelectionChanged: (FastItem option) {
              log('${option.label} selected');
            },
          ),
        ],
      ),
    );
  }
}
