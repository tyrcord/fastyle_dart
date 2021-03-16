import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListView<T extends FastItem> extends StatelessWidget {
  final List<T> items;
  final List<FastCategory>? categories;
  final bool shouldGroupByCategory;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T>? listItemBuilder;
  final EdgeInsets? itemContentPadding;
  final bool useDenseListItem;

  FastListView({
    Key? key,
    required this.items,
    this.categories,
    this.shouldGroupByCategory = false,
    this.isEnabled = true,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
    this.useDenseListItem = true,
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
      sortItems: shouldSortItems,
      categories: categories,
      groupByCategory: shouldGroupByCategory,
    );
  }

  Widget _buildListItems(BuildContext context, T item, int index) {
    if (listItemBuilder != null) {
      return listItemBuilder!(context, item, index);
    }

    return FastListItemLayout(
      contentPadding: itemContentPadding,
      labelText: item.labelText,
      descriptionText: item.descriptionText,
      leading: item.descriptor?.leading,
      trailing: item.descriptor?.trailing,
      isEnabled: item.isEnabled,
      isDense: item.descriptor?.isDense ?? useDenseListItem,
    );
  }
}
