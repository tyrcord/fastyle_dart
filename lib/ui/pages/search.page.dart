import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';

const _kIconSize = 28.0;
const _kBlurRadius = 3.0;

class FastSearchPage<T extends FastItem> extends StatefulWidget {
  final bool Function(T option, String query)? onSearch;
  final List<FastCategory>? categories;
  final String? clearSelectionText;
  final int intialCategoryIndex;
  final String? allCategoryText;
  final String? placeholderText;
  final Widget? clearSearchIcon;
  final bool canClearSelection;
  final bool groupByCategory;
  final bool useFuzzySearch;
  final Widget? closeIcon;
  final Widget? backIcon;
  final String titleText;
  final bool sortItems;
  final List<T> items;
  final T? selection;

  FastSearchPage({
    required this.items,
    this.clearSelectionText = kFastClearSelectionText,
    this.titleText = kFastSelectTitleText,
    this.canClearSelection = true,
    this.groupByCategory = false,
    this.intialCategoryIndex = 0,
    this.useFuzzySearch = false,
    this.sortItems = true,
    this.clearSearchIcon,
    this.placeholderText,
    this.allCategoryText,
    this.categories,
    this.selection,
    this.closeIcon,
    this.backIcon,
    this.onSearch,
  }) : super();

  @override
  State<StatefulWidget> createState() => FastSearchPageState<T>();
}

class FastSearchPageState<T extends FastItem> extends State<FastSearchPage<T>> {
  List<T>? _suggestions;
  String? _searchQuery;

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<FastThemeBloc>(context);
    final brightness = themeBloc.currentState.brightness;
    final overlayStyle = brightness == Brightness.dark
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
      color: ThemeHelper.colors.getBackGroundColor(context),
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
              child: FastHeadline(text: widget.titleText),
            ),
            FastSearchBar(
              showShowBottomBorder: false,
              shouldUseFuzzySearch: widget.useFuzzySearch,
              items: widget.items,
              placeholderText: widget.placeholderText,
              closeIcon: widget.closeIcon,
              showLeadingIcon: false,
              backIcon: widget.backIcon,
              clearSearchIcon: widget.clearSearchIcon,
              onSuggestions: (List<T>? suggestions, String? query) {
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
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final useCloseButton =
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
    final _shouldSortItems = _searchQuery != null && widget.useFuzzySearch
        ? false
        : widget.sortItems;

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: FastSelectableListView(
                shouldSortItems: _shouldSortItems,
                items: _suggestions ?? widget.items,
                onSelectionChanged: (T item) => _close(context, item),
                categories: widget.categories,
                shouldGroupByCategory:
                    _searchQuery == null ? widget.groupByCategory : false,
                selection: widget.selection,
                intialTabIndex: widget.intialCategoryIndex,
                tabAllCategoryText: widget.allCategoryText,
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
          text: widget.clearSelectionText!,
          onTap: () => _close(context, null),
        ),
      ),
    );
  }

  void _close(BuildContext context, T? item) => Navigator.pop(context, item);
}
