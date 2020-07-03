import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNavigationListView<T extends FastItem> extends StatefulWidget {
  final ValueChanged<T> onSelectionChanged;
  final List<T> items;
  final T selection;
  final bool isEnabled;
  final bool isViewScrollable;
  final bool showItemDivider;
  final bool shouldSortItems;
  final FastListItemBuilder<T> listItemBuilder;
  final EdgeInsets itemContentPadding;
  final bool showSearchBar;

  FastNavigationListView({
    Key key,
    @required this.onSelectionChanged,
    @required this.items,
    this.selection,
    this.isEnabled = true,
    this.isViewScrollable = true,
    this.shouldSortItems = true,
    this.showItemDivider = false,
    this.listItemBuilder,
    this.itemContentPadding,
    this.showSearchBar = false,
  }) : super(key: key);

  @override
  _FastNavigationListViewState<T> createState() =>
      _FastNavigationListViewState<T>();
}

class _FastNavigationListViewState<T extends FastItem>
    extends State<FastNavigationListView<T>> {
  List<T> _suggestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.showSearchBar)
          FastSearchBar(
            items: widget.items,
            showLeadingIcon: false,
            onSuggestions: (List<T> suggestions, String query) {
              setState(() => _suggestions = suggestions);
            },
          ),
        Expanded(
          child: FastListViewLayout<T>(
            listItemBuilder: _buildListItems,
            items: _suggestions ?? widget.items,
            isViewScrollable: widget.isViewScrollable,
            showItemDivider: widget.showItemDivider,
            shouldSortItems: widget.shouldSortItems,
          ),
        ),
      ],
    );
  }

  Widget _buildListItems(BuildContext context, T item, int index) {
    if (widget.listItemBuilder != null) {
      return widget.listItemBuilder(context, item, index);
    }

    return _buildNavigationListItem(context, item);
  }

  Widget _buildNavigationListItem(BuildContext context, T item) {
    return FastNavigationListItem(
      contentPadding: widget.itemContentPadding,
      item: item,
      onTap: () {
        if (widget.isEnabled && item.isEnabled) {
          setState(() {
            _suggestions = null;
            FocusScope.of(context).unfocus();
            widget.onSelectionChanged(item);
          });
        }
      },
    );
  }
}
