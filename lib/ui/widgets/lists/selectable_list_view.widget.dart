import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSelectableListView<T extends FastItem> extends StatefulWidget {
  final ValueChanged<T> onSelectionChanged;
  final List<T> items;
  final T? selection;
  final List<FastCategory>? categories;
  final bool shouldGroupByCategory;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T>? listItemBuilder;
  final EdgeInsets? itemContentPadding;
  final int intialTabIndex;
  final String? tabAllCategoryText;

  FastSelectableListView({
    Key? key,
    required this.onSelectionChanged,
    required this.items,
    this.categories,
    this.selection,
    this.shouldGroupByCategory = false,
    this.isEnabled = true,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
    this.listItemBuilder,
    this.itemContentPadding,
    this.intialTabIndex = 0,
    this.tabAllCategoryText,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSelectableListViewState<T>();
}

class _FastSelectableListViewState<T extends FastItem>
    extends State<FastSelectableListView<T>> {
  T? _selection;

  @override
  void initState() {
    _selection = widget.selection;
    super.initState();
  }

  @override
  void didUpdateWidget(FastSelectableListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selection != widget.selection) {
      _selection = widget.selection;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FastListViewLayout(
      listItemBuilder: _buildListItems,
      items: widget.items,
      isViewScrollable: widget.isViewScrollable,
      showItemDivider: widget.showItemDivider,
      sortItems: widget.shouldSortItems,
      categories: widget.categories,
      groupByCategory: widget.shouldGroupByCategory,
      intialCategoryIndex: widget.intialTabIndex,
      allCategoryText: widget.tabAllCategoryText,
    );
  }

  Widget _buildListItems(BuildContext context, T item, int index) {
    if (widget.listItemBuilder != null) {
      return widget.listItemBuilder!(context, item, index);
    }

    return _buildSelectableListItem(item);
  }

  Widget _buildSelectableListItem(T item) {
    return FastSelectableListItem(
      key: UniqueKey(),
      contentPadding: widget.itemContentPadding,
      item: item,
      onTap: () {
        if (widget.isEnabled && item.isEnabled) {
          _onSelectionChange(item);
        }
      },
      isSelected: _selection != null ? item.value == _selection!.value : false,
    );
  }

  void _onSelectionChange(T item) {
    if (item != _selection) {
      setState(() {
        _selection = item;
        widget.onSelectionChanged(item);
      });
    }
  }
}
