import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNavigationListView<T extends FastItem> extends StatelessWidget {
  final ValueChanged<T> onSelectionChanged;
  final List<T> items;
  final T selection;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T> listItemBuilder;
  final EdgeInsets itemContentPadding;

  FastNavigationListView({
    Key key,
    @required this.onSelectionChanged,
    @required this.items,
    this.selection,
    this.isEnabled = true,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
    this.listItemBuilder,
    this.itemContentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListViewLayout(
      listItemBuilder: _buildListItems,
      items: items,
      isViewScrollable: isViewScrollable,
      showItemDivider: showItemDivider,
      shouldSortItems: shouldSortItems,
    );
  }

  Widget _buildListItems(BuildContext context, T item, int index) {
    if (listItemBuilder != null) {
      return listItemBuilder(context, item, index);
    }

    return _buildNavigationListItem(item);
  }

  Widget _buildNavigationListItem(T item) {
    return FastNavigationListItem(
      contentPadding: itemContentPadding,
      item: item,
      onTap: () {
        if (isEnabled && item.isEnabled) {
          onSelectionChanged(item);
        }
      },
    );
  }
}
