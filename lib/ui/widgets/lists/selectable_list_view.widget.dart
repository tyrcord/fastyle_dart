import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSelectableListView<T extends FastItem> extends StatefulWidget {
  final ValueChanged<T> onSelectionChanged;
  final List<T> items;
  final T selection;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T> listItemBuilder;
  final EdgeInsets itemContentPadding;
  final int intialTabIndex;
  final String tabAllCategoryText;

  FastSelectableListView({
    Key key,
    @required this.onSelectionChanged,
    @required this.items,
    this.categories,
    this.selection,
    bool shouldGroupByCategory = false,
    bool isEnabled = true,
    bool isViewScrollable = true,
    bool shouldSortItems = true,
    bool showItemDivider = false,
    this.listItemBuilder,
    this.itemContentPadding,
    this.intialTabIndex,
    this.tabAllCategoryText,
  })  : assert(items != null),
        assert(onSelectionChanged != null),
        shouldGroupByCategory = shouldGroupByCategory ?? false,
        isEnabled = isEnabled ?? true,
        isViewScrollable = isViewScrollable ?? true,
        shouldSortItems = shouldSortItems ?? true,
        showItemDivider = showItemDivider ?? false,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSelectableListViewState<T>();
}

class _FastSelectableListViewState<T extends FastItem>
    extends State<FastSelectableListView<T>> {
  T _selection;

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
      isViewScrollable: widget.isViewScrollable ?? true,
      showItemDivider: widget.showItemDivider ?? false,
      shouldSortItems: widget.shouldSortItems ?? true,
      categories: widget.categories,
      shouldGroupByCategory: widget.shouldGroupByCategory ?? false,
      intialTabIndex: widget.intialTabIndex,
      tabAllCategoryText: widget.tabAllCategoryText,
    );
  }

  Widget _buildListItems(BuildContext context, T option, int index) {
    if (widget.listItemBuilder != null) {
      return widget.listItemBuilder(context, option, index);
    }

    return _buildSelectableListItem(option);
  }

  Widget _buildSelectableListItem(T option) {
    return FastSelectableListItem(
      key: UniqueKey(),
      contentPadding: widget.itemContentPadding,
      item: option,
      onTap: () {
        if (widget.isEnabled && option.isEnabled) {
          _onSelectionChange(option);
        }
      },
      isSelected: option.value == _selection?.value,
    );
  }

  void _onSelectionChange(T option) {
    if (option != _selection) {
      setState(() {
        _selection = option;
        widget.onSelectionChanged(option);
      });
    }
  }
}