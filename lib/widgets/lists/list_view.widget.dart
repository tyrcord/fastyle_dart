import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListView<T extends FastItem> extends StatelessWidget {
  final List<T> items;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T> listItemBuilder;
  final EdgeInsets itemContentPadding;

  FastListView({
    Key key,
    @required this.items,
    this.categories,
    this.shouldGroupByCategory = false,
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
      categories: categories,
      shouldGroupByCategory: shouldGroupByCategory,
    );
  }

  Widget _buildListItems(BuildContext context, T option, int index) {
    if (listItemBuilder != null) {
      return listItemBuilder(context, option, index);
    }

    return FastListItemLayout(
      contentPadding: itemContentPadding,
      titleText: option.label,
      descriptionText: option.description,
      leading: option.descriptor?.leading,
      trailing: option.descriptor?.trailing,
      isEnabled: option.isEnabled,
      isDense: option.descriptor?.isDense,
    );
  }
}