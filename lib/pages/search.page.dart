import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:tbloc_dart/tbloc_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FastSearchBar(
                    items: widget.items,
                    placeholderText: widget.placeholderText,
                    closeIcon: widget.closeIcon,
                    backIcon: widget.backIcon,
                    deleteIcon: widget.deleteIcon,
                    onSuggestions: (List<T> suggestions, String query) {
                      setState(() {
                        _suggestions = suggestions;
                        _searchQuery = query;
                      });
                    },
                    onLeadingButtonTap: () {
                      _close(context, widget.selection);
                    },
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

  void _close(BuildContext context, T item) {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pop(context, item);
  }
}
