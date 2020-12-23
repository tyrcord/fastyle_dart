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
  final String placeholderSearchText;
  final Icon clearSearchIcon;
  final bool shouldUseFuzzySearch;

  FastNavigationListView({
    Key key,
    @required this.onSelectionChanged,
    @required this.items,
    this.selection,
    this.listItemBuilder,
    this.itemContentPadding,
    this.placeholderSearchText,
    this.clearSearchIcon,
    bool isEnabled = true,
    bool isViewScrollable = true,
    bool shouldSortItems = true,
    bool showItemDivider = false,
    bool showSearchBar = false,
    bool shouldUseFuzzySearch = false,
  })  : assert(onSelectionChanged != null),
        assert(items != null),
        isEnabled = isEnabled ?? true,
        isViewScrollable = isViewScrollable ?? true,
        shouldSortItems = shouldSortItems ?? true,
        showItemDivider = showItemDivider ?? false,
        showSearchBar = showSearchBar ?? false,
        shouldUseFuzzySearch = shouldUseFuzzySearch ?? false,
        super(key: key);

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
            shouldUseFuzzySearch: widget.shouldUseFuzzySearch,
            items: widget.items,
            showLeadingIcon: false,
            onSuggestions: (List<T> suggestions, String query) {
              setState(() => _suggestions = suggestions);
            },
            placeholderText: widget.placeholderSearchText,
            clearSearchIcon: widget.clearSearchIcon,
          ),
        Expanded(
          child: FastListViewLayout<T>(
            listItemBuilder: _buildListItems,
            items: _suggestions ?? widget.items,
            isViewScrollable: widget.isViewScrollable,
            showItemDivider: widget.showItemDivider,
            shouldSortItems:
                widget.shouldUseFuzzySearch ? false : widget.shouldSortItems,
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
          FocusScope.of(context).unfocus();
          widget.onSelectionChanged(item);
        }
      },
    );
  }
}
