import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSelectableListView extends StatefulWidget {
  final ValueChanged<FastItem> onSelectionChanged;
  final List<FastItem> items;
  final FastItem selection;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder listItemBuilder;

  FastSelectableListView({
    Key key,
    @required this.onSelectionChanged,
    @required this.items,
    this.categories,
    this.shouldGroupByCategory = false,
    this.selection,
    this.isEnabled = true,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
    this.listItemBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSelectableListViewState();
}

class _FastSelectableListViewState extends State<FastSelectableListView> {
  FastItem _selection;

  @override
  void initState() {
    _selection = widget.selection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FastListViewLayout(
      listItemBuilder: _buildListeTitle,
      items: widget.items,
      isViewScrollable: widget.isViewScrollable,
      showItemDivider: widget.showItemDivider,
      shouldSortItems: widget.shouldSortItems,
      categories: widget.categories,
      shouldGroupByCategory: widget.shouldGroupByCategory,
    );
  }

  Widget _buildListeTitle(BuildContext context, FastItem option, int index) {
    if (widget.listItemBuilder != null) {
      return widget.listItemBuilder(context, option, index);
    }

    return _buildSelectableListItem(option);
  }

  Widget _buildSelectableListItem(FastItem option) {
    return FastSelectableListItem(
      item: option,
      onTap: () {
        if (widget.isEnabled && option.isEnabled) {
          _onSelectionChange(option);
        }
      },
      isSelected: option == _selection,
    );
  }

  void _onSelectionChange(FastItem option) {
    if (option != _selection) {
      setState(() {
        _selection = option;
        widget.onSelectionChanged(option);
      });
    }
  }
}
