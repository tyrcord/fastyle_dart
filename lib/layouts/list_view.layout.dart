import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kFastListTileCategoryAll = FastCategory(
  label: kFastAllString,
  value: kFastAllString,
);

class FastListViewLayout extends StatelessWidget {
  final List<FastItem> items;
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

  Widget _buildTabViews(BuildContext context, List<FastItem> items) {
    final List<ListView> views = [];
    final List<Tab> tabs = [];

    final List<FastListItemCategory> listCategories = _buildListCategories(
      items,
    );

    listCategories.forEach((FastListItemCategory listCategory) {
      tabs.add(Tab(text: toBeginningOfSentenceCase(listCategory.label)));
      views.add(_buildListView(context, listCategory.items));
    });

    return FastTabs(
      tabs: tabs,
      views: views,
    );
  }

  Widget _buildListView(BuildContext context, List<FastItem> items) {
    if (shouldSortItems) {
      items.sort((a, b) => a.label.compareTo(b.label));
    }

    final lastIndex = items.length - 1;
    final Decoration dividerDecoration = showItemDivider
        ? BoxDecoration(
            border: Border(
              bottom: Divider.createBorderSide(context),
            ),
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
      children: items.asMap().entries.map((MapEntry<int, FastItem> entry) {
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

  List<FastListItemCategory> _buildListCategories(List<FastItem> items) {
    final Map<String, FastListItemCategory> categoriesMap = {
      kFastListTileCategoryAll.value: _buildListCategory(
        kFastListTileCategoryAll,
      ),
    };

    final allCategory = categoriesMap[kFastListTileCategoryAll.value].items;

    items.forEach((FastItem item) {
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

  FastListItemCategory _buildListCategory(FastCategory category) {
    return FastListItemCategory(
      label: category.label,
      value: category.value,
      items: [],
    );
  }

  Widget _buildListItem({
    BuildContext context,
    FastItem item,
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
