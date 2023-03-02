import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListView<T extends FastItem> extends StatelessWidget {
  final FastListItemBuilder<T>? listItemBuilder;
  final EdgeInsets? itemContentPadding;
  final List<FastCategory>? categories;
  final bool useDenseListItem;
  final bool isViewScrollable;
  final bool groupByCategory;
  final bool showItemDivider;
  final bool isEnabled;
  final bool sortItems;
  final List<T> items;
  final EdgeInsets padding;

  const FastListView({
    Key? key,
    required this.items,
    this.padding = EdgeInsets.zero,
    this.groupByCategory = false,
    this.showItemDivider = false,
    this.useDenseListItem = true,
    this.isViewScrollable = true,
    this.sortItems = true,
    this.isEnabled = true,
    this.itemContentPadding,
    this.listItemBuilder,
    this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListViewLayout(
      listItemBuilder: _buildListItems,
      items: items,
      isViewScrollable: isViewScrollable,
      showItemDivider: showItemDivider,
      sortItems: sortItems,
      groupByCategory: groupByCategory,
      padding: padding,
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
