import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const kFastListTileCategoryAll = FastCategory(
  label: kFastAllString,
  value: kFastAllString,
);

class FastListViewLayout<T extends FastItem> extends StatelessWidget {
  final List<T> items;
  final FastListItemBuilder listItemBuilder;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool isViewScrollable;
  final bool shouldSortItems;
  final bool showItemDivider;

  FastListViewLayout({
    Key key,
    @required this.items,
    @required this.listItemBuilder,
    this.categories,
    this.shouldGroupByCategory = false,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _items = [...items];

    if (shouldGroupByCategory) {
      return _buildTabViews(context, _items);
    }

    return _buildListView(context, _items);
  }

  Widget _buildTabViews(BuildContext context, List<T> items) {
    final List<ListView> views = [];
    final List<Tab> tabs = [];

    final List<FastListItemCategory<T>> listCategories = _buildListCategories(
      items,
    );

    listCategories.forEach((FastListItemCategory<T> listCategory) {
      tabs.add(Tab(text: toBeginningOfSentenceCase(listCategory.label)));
      views.add(_buildListView(context, listCategory.items));
    });

    return FastTabs(tabs: tabs, views: views);
  }

  Widget _buildListView(BuildContext context, List<T> items) {
    if (shouldSortItems) {
      items = items.map((T item) {
        return item.copyWith(normalizedLabel: normalizeText(item.label)) as T;
      }).toList();

      items.sort((a, b) => a.normalizedLabel.compareTo(b.normalizedLabel));
    }

    final lastIndex = items.length - 1;
    final Decoration dividerDecoration = showItemDivider
        ? BoxDecoration(
            border: Border(bottom: Divider.createBorderSide(context)),
          )
        : null;

    if (isViewScrollable || shouldGroupByCategory) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(
            context: context,
            item: items[index],
            index: index,
            isLastItem: index < lastIndex,
            decoration: dividerDecoration,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.asMap().entries.map((MapEntry<int, T> entry) {
        return _buildListItem(
          context: context,
          item: entry.value,
          index: entry.key,
          isLastItem: entry.key < lastIndex,
          decoration: dividerDecoration,
        );
      }).toList(),
    );
  }

  List<FastListItemCategory<T>> _buildListCategories(List<T> items) {
    final Map<String, FastListItemCategory<T>> categoriesMap = {
      kFastListTileCategoryAll.value: _buildListCategory(
        kFastListTileCategoryAll,
      ),
    };

    final allCategory = categoriesMap[kFastListTileCategoryAll.value].items;

    items.forEach((T item) {
      item.categories?.forEach((FastCategory category) {
        if (!categoriesMap.containsKey(category.value)) {
          categoriesMap[category.value] = _buildListCategory(category);
        }

        if (allCategory.indexOf(item) == -1) {
          allCategory.add(item);
        }

        categoriesMap[category.value].items.add(item);
      });
    });

    return categoriesMap.values.toList();
  }

  FastListItemCategory<T> _buildListCategory(FastCategory category) {
    return FastListItemCategory(
      label: category.label,
      value: category.value,
      items: <T>[],
    );
  }

  Widget _buildListItem({
    BuildContext context,
    T item,
    int index,
    bool isLastItem,
    BoxDecoration decoration,
  }) {
    Widget listItem = listItemBuilder(context, item, index);

    if (isLastItem && decoration != null) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: decoration,
        child: listItem,
      );
    }

    return listItem;
  }
}
