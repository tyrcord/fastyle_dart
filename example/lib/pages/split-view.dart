import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart_example/data/items.dart';
import 'package:flutter/material.dart';

class SplitViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FastSectionPage(
      contentPadding: EdgeInsets.zero,
      child: FastNavigationSplitView(
        detailsBuilder: (BuildContext context, FastItem item) {
          return Center(
            child: FastBody(
              text: item.labelText,
            ),
          );
        },
        items: demoItems,
      ),
    );
  }
}
