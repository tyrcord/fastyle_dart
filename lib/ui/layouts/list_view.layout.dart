import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const kFastListTileCategoryAll = FastCategory(
  labelText: kFastAllString,
  valueText: kFastAllString,
  weight: 999,
);

class FastListViewLayout<T extends FastItem> extends StatelessWidget {
  final FastListItemBuilder<T> listItemBuilder;
  final List<FastCategory>? categories;
  final bool shouldGroupByCategory;
  final String? tabAllCategoryText;
  final bool isViewScrollable;
  final bool shouldSortItems;
  final bool showItemDivider;
  final int intialTabIndex;
  final List<T> items;

  FastListViewLayout({
    Key? key,
    required this.listItemBuilder,
    required this.items,
    this.tabAllCategoryText,
    this.intialTabIndex = 0,
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
    final listCategories = _buildListCategories(items);
    final views = <Widget>[];
    final tabs = <Tab>[];

    listCategories.forEach((FastListItemCategory<T> listCategory) {
      tabs.add(Tab(text: toBeginningOfSentenceCase(listCategory.labelText)));
      views.add(_buildListView(context, listCategory.items));
    });

    return FastTabs(tabs: tabs, views: views, initialIndex: intialTabIndex);
  }

  Widget _buildListView(BuildContext context, List<T> items) {
    if (isViewScrollable || shouldGroupByCategory) {
      return _buildScrollableContent(context, items);
    }

    return _buildFixedContent(context, items);
  }

  Widget _buildScrollableContent(BuildContext context, List<T> items) {
    final dividerDecoration = _buildDividerDecorationIdNeeded(context);
    final rows = _sortItemIfNeeded(items);
    final lastIndex = rows.length - 1;

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: rows.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(
          context: context,
          item: rows[index],
          index: index,
          isLastItem: index < lastIndex,
          decoration: dividerDecoration,
        );
      },
    );
  }

  Widget _buildFixedContent(BuildContext context, List<T> items) {
    final dividerDecoration = _buildDividerDecorationIdNeeded(context);
    final rows = _sortItemIfNeeded(items);
    final lastIndex = rows.length - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.asMap().entries.map((MapEntry<int, T> entry) {
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

  BoxDecoration? _buildDividerDecorationIdNeeded(BuildContext context) {
    return showItemDivider
        ? BoxDecoration(
            border: Border(
            bottom: Divider.createBorderSide(context),
          ))
        : null;
  }

  List<T> _sortItemIfNeeded(List<T> items) {
    if (shouldSortItems) {
      items = items.map((T item) {
        return item.copyWith(
          normalizedLabelText: normalizeTextByRemovingDiacritics(
            item.labelText,
          ),
        ) as T;
      }).toList();

      items.sort(
        (a, b) => a.normalizedLabelText!.compareTo(b.normalizedLabelText!),
      );
    }

    return items;
  }

  List<FastListItemCategory<T>> _buildListCategories(List<T> items) {
    final categoriesMap = {
      kFastListTileCategoryAll.valueText: _buildListCategory(
        kFastListTileCategoryAll.copyWith(
          labelText: tabAllCategoryText ?? kFastListTileCategoryAll.labelText,
        ),
      ),
    };

    final allCategory =
        categoriesMap[kFastListTileCategoryAll.valueText]!.items;

    items.forEach((T item) {
      item.categories?.forEach((FastCategory category) {
        if (!categoriesMap.containsKey(category.valueText)) {
          categoriesMap[category.valueText] = _buildListCategory(category);
        }

        if (!allCategory.contains(item)) {
          allCategory.add(item);
        }

        categoriesMap[category.valueText]!.items.add(item);
      });
    });

    final categories = categoriesMap.values.toList();
    categories.sort((a, b) => b.weight.compareTo(a.weight));

    return categories;
  }

  FastListItemCategory<T> _buildListCategory(FastCategory category) {
    return FastListItemCategory(
      labelText: category.labelText,
      valueText: category.valueText,
      weight: category.weight,
      items: <T>[],
    );
  }

  Widget _buildListItem({
    required bool isLastItem,
    required T item,
    required BuildContext context,
    required int index,
    BoxDecoration? decoration,
  }) {
    final listItem = listItemBuilder(context, item, index);

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
