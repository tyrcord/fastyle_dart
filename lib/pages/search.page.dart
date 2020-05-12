import 'package:diacritic/diacritic.dart';
import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbloc_dart/core/base/base.dart';

const _kIconSize = 28.0;

class FastSearchPage<T extends FastItem> extends StatefulWidget {
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final List<T> items;
  final T selection;
  final String placeholderText;
  final Icon closeIcon;
  final Icon backIcon;
  final Icon deleteIcon;
  final bool shouldSortItems;
  final bool Function(T option, String query) onSearch;

  FastSearchPage({
    @required this.items,
    this.categories,
    this.shouldGroupByCategory = false,
    this.selection,
    this.placeholderText,
    this.closeIcon,
    this.backIcon,
    this.deleteIcon,
    this.shouldSortItems = true,
    this.onSearch,
  }) : super();

  @override
  State<StatefulWidget> createState() => FastSearchPageState<T>();
}

class FastSearchPageState<T extends FastItem> extends State<FastSearchPage<T>> {
  TextEditingController _textEditingController = TextEditingController();
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
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Semantics(
          container: true,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildSearchAppBar(context),
                  _buildContent(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAppBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: ThemeHelper.borderSize,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildLeadingIcon(context),
          _buildTextInput(context),
          _buildDeleteIcon(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: FastSelectableListView(
        shouldSortItems: widget.shouldSortItems ?? true,
        items: _suggestions ?? widget.items,
        onSelectionChanged: (FastItem item) => _close(context, item),
        categories: widget.categories,
        shouldGroupByCategory:
            _searchQuery == null ? widget.shouldGroupByCategory : false,
        selection: widget.selection,
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

  Widget _buildTextInput(BuildContext context) {
    return Expanded(
      child: FastSearchField(
        margin: EdgeInsets.zero,
        textEditingController: _textEditingController,
        onValueChanged: (String queryText) {
          setState(() {
            if (queryText.isNotEmpty) {
              _searchQuery = _normalizeText(queryText);
              _buildSuggestions(_searchQuery);
            } else {
              _clearState();
            }
          });
        },
      ),
    );
  }

  Widget _buildDeleteIcon(BuildContext context) {
    final theme = Theme.of(context);

    return widget.deleteIcon ??
        FastIconButton(
          icon: Icon(Icons.delete_outline),
          iconColor: _searchQuery == null ? theme.hintColor : null,
          onTap: () {
            setState(() {
              _textEditingController.clear();
              _clearState();
            });
          },
          iconSize: _kIconSize,
        );
  }

  void _close(BuildContext context, T item) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pop(context, item);
  }

  void _buildSuggestions(String query) {
    setState(() {
      _suggestions = widget.items.where((T option) {
        if (widget.onSearch != null) {
          return widget.onSearch(option, query);
        }

        return _onSearch(option, query);
      }).toList();
    });
  }

  void _clearState() {
    _searchQuery = null;
    _suggestions = null;
  }

  bool _onSearch(T option, String query) {
    return _normalizeText(option.label).contains(query);
  }

  String _normalizeText(String text) {
    return removeDiacritics(text.toLowerCase());
  }
}
