import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kIconSize = 28.0;

class FastSearchPage<T extends FastItem> extends StatefulWidget {
  final bool Function(T option, String query) onSearch;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool shouldUseFuzzySearch;
  final String placeholderText;
  final Widget clearSearchIcon;
  final bool shouldSortItems;
  final Widget closeIcon;
  final List<T> items;
  final Widget backIcon;
  final T selection;
  final String titleText;
  final int intialTabIndex;
  final String tabAllCategoryText;

  FastSearchPage({
    @required this.items,
    bool shouldGroupByCategory = false,
    bool shouldUseFuzzySearch = false,
    bool shouldSortItems = true,
    this.clearSearchIcon,
    this.placeholderText,
    this.categories,
    this.selection,
    this.closeIcon,
    this.backIcon,
    this.onSearch,
    this.titleText,
    this.intialTabIndex,
    this.tabAllCategoryText,
  })  : this.shouldGroupByCategory = shouldGroupByCategory ?? false,
        this.shouldUseFuzzySearch = shouldUseFuzzySearch ?? false,
        this.shouldSortItems = shouldSortItems ?? true,
        assert(items != null),
        super();

  @override
  State<StatefulWidget> createState() => FastSearchPageState<T>();
}

class FastSearchPageState<T extends FastItem> extends State<FastSearchPage<T>> {
  List<T> _suggestions;
  String _searchQuery;

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    final brightness = themeBloc.currentState.brightness;
    final hasTitle = widget.titleText != null;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Semantics(
          container: true,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (hasTitle) _buildTitle(),
                  FastSearchBar(
                    shouldUseFuzzySearch: widget.shouldUseFuzzySearch,
                    items: widget.items,
                    placeholderText: widget.placeholderText,
                    closeIcon: widget.closeIcon,
                    showLeadingIcon: !hasTitle,
                    backIcon: widget.backIcon,
                    clearSearchIcon: widget.clearSearchIcon,
                    onSuggestions: (List<T> suggestions, String query) {
                      setState(() {
                        _suggestions = suggestions;
                        _searchQuery = query;
                      });
                    },
                    onLeadingButtonTap: () => _close(context, widget.selection),
                  ),
                  _buildContent(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeadingIcon(context),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: ThemeHelper.borderSize,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: FastHeadline(text: widget.titleText),
        ),
      ],
    );
  }

  FastIconButton _buildLeadingIcon(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final closeIcon = widget.closeIcon ?? Icon(Icons.close);
    final backIcon = widget.backIcon ?? Icon(Icons.arrow_back);

    return FastIconButton(
      icon: useCloseButton ? closeIcon : backIcon,
      onTap: () => _close(context, widget.selection),
      iconSize: _kIconSize,
    );
  }

  Widget _buildContent(BuildContext context) {
    final _shouldSortItems = _searchQuery != null && widget.shouldUseFuzzySearch
        ? false
        : widget.shouldSortItems;

    return Expanded(
      child: FastSelectableListView(
        shouldSortItems: _shouldSortItems,
        items: _suggestions ?? widget.items,
        onSelectionChanged: (FastItem item) => _close(context, item),
        categories: widget.categories,
        shouldGroupByCategory:
            _searchQuery == null ? widget.shouldGroupByCategory : false,
        selection: widget.selection,
        intialTabIndex: widget.intialTabIndex,
        tabAllCategoryText: widget.tabAllCategoryText,
      ),
    );
  }

  void _close(BuildContext context, T item) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pop(context, item);
  }
}
