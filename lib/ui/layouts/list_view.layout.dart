import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const kFastListTileCategoryAll = FastInternalCategory(
  labelText: kFastAllString,
  valueText: kFastAllString,
  weight: 1000,
);

class FastListViewLayout<T extends FastItem> extends StatelessWidget {
  ///
  /// Function that creates a list item for a given index and item.
  ///
  final FastListItemBuilder<T> listItemBuilder;

  ///
  /// Text that describes the all category.
  ///
  final String? allCategoryText;

  ///
  /// Indicates the initial category selected.
  ///
  final int intialCategoryIndex;

  ///
  /// Indicates whether the view initial is scrollable.
  ///
  final bool isViewScrollable;

  ///
  /// Indicates whether the list should be displayed as a tab view
  /// and grouped by categories.
  ///
  final bool groupByCategory;

  ///
  /// Indicates whether a thin horizontal line should be used as separator
  /// between items.
  ///
  final bool showItemDivider;

  ///
  /// Indicates whether the list should sort the items.
  ///
  final bool sortItems;

  ///
  /// Items to display.
  ///
  final List<T> items;

  FastListViewLayout({
    Key? key,
    required this.listItemBuilder,
    required this.items,
    this.intialCategoryIndex = 0,
    this.groupByCategory = false,
    this.isViewScrollable = true,
    this.showItemDivider = false,
    this.sortItems = true,
    this.allCategoryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _items = [...items];

    if (groupByCategory) {
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

    return FastTabs(
      initialIndex: intialCategoryIndex,
      tabs: tabs,
      views: views,
    );
  }

  Widget _buildListView(BuildContext context, List<T> items) {
    if (isViewScrollable || groupByCategory) {
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
    return showItemDivider ? ThemeHelper.createBorderSide(context) : null;
  }

  List<T> _sortItemIfNeeded(List<T> items) {
    if (sortItems) {
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
          labelText: allCategoryText ?? kFastListTileCategoryAll.labelText,
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
