import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class NavigationBarViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final options = List<FastItem>.generate(50, (int index) {
      return FastItem(labelText: index.toString(), value: index);
    });

    return FastSectionPage(
      contentPadding: EdgeInsets.zero,
      child: FastNavigationBarView(
        indicatorColor: ThemeHelper.getPaletteColors(context).mint.mid,
        showAppBar: false,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
        children: [
          FastSectionPage(
            titleText: 'Explore',
            showAppBar: false,
            isViewScrollable: false,
            child: FastSelectableListView(
              showItemDivider: true,
              items: options,
              sortItems: false,
              onSelectionChanged: (FastItem option) {
                debugPrint('${option.labelText} selected');
              },
            ),
          ),
          FastSectionPage(
            titleText: 'Commute',
            showAppBar: false,
          ),
          FastSectionPage(
            titleText: 'Saved',
            showAppBar: false,
          ),
        ],
      ),
    );
  }
}
