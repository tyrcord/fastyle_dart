import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSelectableListView<T extends FastItem> extends StatefulWidget {
  final FastListItemBuilder<T>? listItemBuilder;
  final ValueChanged<T> onSelectionChanged;
  final EdgeInsets? itemContentPadding;
  final List<FastCategory>? categories;
  final String? allCategoryText;
  final int intialCategoryIndex;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool groupByCategory;
  final bool sortItems;
  final bool isEnabled;
  final List<T> items;
  final T? selection;

  FastSelectableListView({
    Key? key,
    required this.onSelectionChanged,
    required this.items,
    this.groupByCategory = false,
    this.isViewScrollable = true,
    this.showItemDivider = false,
    this.intialCategoryIndex = 0,
    this.sortItems = true,
    this.isEnabled = true,
    this.itemContentPadding,
    this.allCategoryText,
    this.listItemBuilder,
    this.categories,
    this.selection,
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
      sortItems: widget.sortItems,
      categories: widget.categories,
      groupByCategory: widget.groupByCategory,
      intialCategoryIndex: widget.intialCategoryIndex,
      allCategoryText: widget.allCategoryText,
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
