import 'dart:developer';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final options = List<FastItem>.generate(50, (int index) {
      return FastItem(labelText: index.toString(), value: index);
    });

    return FastSectionPage(
      titleText: 'Tabs',
      contentPadding: EdgeInsets.zero,
      child: FastTabs(
        tabs: [
          Tab(text: 'Favorites'),
          Tab(text: 'All'),
          Tab(text: 'Forex'),
          Tab(text: 'Commodoties'),
          Tab(text: 'Cryptocurrencies'),
          Tab(text: 'Stocks'),
        ],
        views: <Widget>[
          Icon(Icons.favorite),
          FastSelectableListView(
            showItemDivider: true,
            items: options,
            onSelectionChanged: (FastItem option) {
              log('${option.labelText} selected');
            },
          ),
          Icon(Icons.euro_symbol),
          Icon(Icons.donut_small),
          Icon(Icons.attach_money),
          Icon(Icons.home),
        ],
      ),
    );
  }
}
