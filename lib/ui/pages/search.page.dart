import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbloc/tbloc.dart';

class FastSearchPage<T extends FastItem> extends StatefulWidget {
  ///
  /// List of categories.
  ///
  final List<FastCategory>? categories;

  ///
  /// Text that describes the clear selection action.
  ///
  final String clearSelectionText;

  ///
  /// Indicates the initial category selected.
  ///
  final int intialCategoryIndex;

  ///
  /// Text that describes the all category.
  ///
  final String? allCategoryText;

  ///
  /// Text that describes the search placeholder.
  ///
  final String searchPlaceholderText;

  ///
  /// The widget used to clear the search query.
  ///
  final Widget clearSearchIcon;

  ///
  /// Indicates whether the selection can be cleared.
  ///
  final bool canClearSelection;

  ///
  /// Indicates whether the list should be displayed as a tab view
  /// and grouped by categories.
  ///
  final bool groupByCategory;

  ///
  /// Indicates whether the search engine witll use fuzzy matching.
  ///
  final bool useFuzzySearch;

  ///
  /// The title of the page.
  ///
  final String titleText;

  ///
  /// The widget used to close the page.
  ///
  final Widget closeIcon;

  ///
  /// The widget used to go back to the previous page.
  ///
  final Widget backIcon;

  ///
  /// Indicates whether the list should sort the items.
  ///
  final bool sortItems;

  ///
  /// Items to display.
  ///
  final List<T> items;

  ///
  /// The currently selected item.
  ///
  final T? selection;

  /// A function that creates additional tab views.
  final List<FastListItemCategory<T>> Function()? extraTabBuilder;

  /// The delegate object that can modify the behavior of the widget.
  final FastListViewLayoutDelegate<T>? delegate;

  final Widget? listViewEmptyContent;
  final String? listViewEmptyText;

  const FastSearchPage({
    super.key,
    required this.items,
    this.searchPlaceholderText = kFastSearchPlaceholderText,
    this.clearSelectionText = kFastClearSelectionText,
    this.clearSearchIcon = kFastClearSearchIcon,
    this.titleText = kFastSelectTitleText,
    this.closeIcon = kFastCloseIcon,
    this.backIcon = kFastBackIcon,
    this.canClearSelection = true,
    this.groupByCategory = false,
    this.intialCategoryIndex = 0,
    this.useFuzzySearch = false,
    this.sortItems = true,
    this.allCategoryText,
    this.extraTabBuilder,
    this.delegate,
    this.categories,
    this.selection,
    this.listViewEmptyContent,
    this.listViewEmptyText,
  });

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
    print('build header');

    return Container(
      color: ThemeHelper.colors.getSecondaryBackgroundColor(context),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLeadingIcon(context),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: FastHeadline(text: widget.titleText),
            ),
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return FastSearchBar(
      showShowBottomBorder: false,
      shouldUseFuzzySearch: widget.useFuzzySearch,
      items: widget.items,
      placeholderText: widget.searchPlaceholderText,
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
    );
  }

  Widget _buildLeadingIcon(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;

    if (canPop) {
      final useCloseButton =
          parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

      return FastIconButton(
        icon: useCloseButton ? widget.closeIcon : widget.backIcon,
        onTap: () => _close(context, widget.selection),
        iconSize: kFastIconSizeLarge,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildListView(BuildContext context) {
    final shadowColor = ThemeHelper.colors.getShadowColor(context);
    final decoration = Container(
      height: 1.5,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: kFastBlurRadius),
        ],
      ),
    );
    final shouldSortItems = _searchQuery != null && widget.useFuzzySearch
        ? false
        : widget.sortItems;

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: ThemeHelper.colors.getPrimaryBackgroundColor(context),
              child: FastSelectableListView(
                sortItems: shouldSortItems,
                items: _suggestions ?? widget.items,
                onSelectionChanged: (T item) => _close(context, item),
                categories: widget.categories,
                extraTabBuilder: widget.extraTabBuilder,
                groupByCategory:
                    _searchQuery == null ? widget.groupByCategory : false,
                selection: widget.selection,
                intialCategoryIndex: widget.intialCategoryIndex,
                allCategoryText: widget.allCategoryText,
                delegate: widget.delegate,
                listViewEmptyContent: widget.listViewEmptyContent,
                listViewEmptyText: widget.listViewEmptyText,
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
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final palette = ThemeHelper.getPaletteColors(context);

    return Container(
      padding: bottomPadding > 0
          ? const EdgeInsets.only(top: 8, left: 16, right: 16)
          : const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      color: ThemeHelper.colors.getSecondaryBackgroundColor(context),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FastTextButton(
              textColor: palette.blue.mid,
              text: widget.clearSelectionText,
              onTap: () => _close(context, null),
            )
          ],
        ),
      ),
    );
  }

  void _close(BuildContext context, T? item) {
    Navigator.pop(context, item);
  }
}
