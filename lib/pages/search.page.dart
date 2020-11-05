import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kIconSize = 28.0;
const _kBlurRadius = 3.0;
const _kSelectTitleText = "Select";
const _kClearSelectionText = "Clear Selection";

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
  final bool canClearSelection;
  final String clearSelectionText;

  FastSearchPage({
    @required this.items,
    this.titleText,
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
    this.intialTabIndex,
    this.tabAllCategoryText,
    bool canClearSelection = true,
    this.clearSelectionText,
  })  : this.shouldGroupByCategory = shouldGroupByCategory ?? false,
        this.shouldUseFuzzySearch = shouldUseFuzzySearch ?? false,
        this.shouldSortItems = shouldSortItems ?? true,
        canClearSelection = canClearSelection ?? true,
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
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(context),
            Expanded(child: _buildListView(context)),
            if (widget.canClearSelection) _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLeadingIcon(context),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: FastHeadline(text: widget.titleText ?? _kSelectTitleText),
            ),
            FastSearchBar(
              showShowBottomBorder: false,
              shouldUseFuzzySearch: widget.shouldUseFuzzySearch,
              items: widget.items,
              placeholderText: widget.placeholderText,
              closeIcon: widget.closeIcon,
              showLeadingIcon: false,
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
          ],
        ),
      ),
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

  Widget _buildListView(BuildContext context) {
    final _shadowColor = ThemeHelper.colors.getShadowColor(context);
    final decoration = Container(
      height: 1.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: _shadowColor, blurRadius: _kBlurRadius)],
      ),
    );
    final _shouldSortItems = _searchQuery != null && widget.shouldUseFuzzySearch
        ? false
        : widget.shouldSortItems;

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
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
            ),
          ),
          Positioned(top: 0, child: decoration),
          Positioned(bottom: 0, child: decoration),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: SafeArea(
        top: false,
        bottom: true,
        child: FastLink(
          textAlign: TextAlign.right,
          text: widget.clearSelectionText ?? _kClearSelectionText,
          onTap: () => _close(context, null),
        ),
      ),
    );
  }

  void _close(BuildContext context, T item) => Navigator.pop(context, item);
}
