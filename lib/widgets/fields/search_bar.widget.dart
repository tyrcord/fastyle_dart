import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kIconSize = 28.0;

class FastSearchBar<T extends FastItem> extends StatefulWidget {
  final List<T> items;
  final String placeholderText;
  final Icon closeIcon;
  final Icon backIcon;
  final Icon clearSearchIcon;
  final bool Function(T option, String query) onSearchFilter;
  final void Function(List<T> _suggestions, String query) onSuggestions;
  final VoidCallback onLeadingButtonTap;
  final bool showLeadingIcon;
  final TextEditingController textEditingController;

  FastSearchBar({
    @required this.items,
    this.placeholderText,
    this.closeIcon,
    this.backIcon,
    this.clearSearchIcon,
    this.onSearchFilter,
    this.onSuggestions,
    this.onLeadingButtonTap,
    this.showLeadingIcon = true,
    this.textEditingController,
  }) : super();

  @override
  _FastSearchBarState createState() => _FastSearchBarState<T>();
}

class _FastSearchBarState<T extends FastItem> extends State<FastSearchBar<T>> {
  TextEditingController _textController;
  FocusNode _focusNode;
  String _searchQuery;

  @override
  initState() {
    _textController = widget.textEditingController ?? TextEditingController();
    _textController.addListener(_handleSearchQueryChanges);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textController.removeListener(_handleSearchQueryChanges);
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _buildSearchAppBar(context);

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
          if (widget.showLeadingIcon) _buildLeadingIcon(context),
          _buildSearchTextInput(context),
          _buildClearIcon(context),
        ],
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
      onTap: () {
        _focusNode.unfocus();
        widget?.onLeadingButtonTap();
      },
      iconSize: _kIconSize,
    );
  }

  Widget _buildSearchTextInput(BuildContext context) {
    return Expanded(
      child: FastSearchField(
        margin: widget.showLeadingIcon
            ? EdgeInsets.zero
            : const EdgeInsets.only(left: 16.0),
        placeholderText: widget.placeholderText,
        textEditingController: _textController,
        focusNode: _focusNode,
      ),
    );
  }

  Widget _buildClearIcon(BuildContext context) {
    final theme = Theme.of(context);

    return FastIconButton(
      icon: widget.clearSearchIcon ?? Icon(Icons.delete_outline),
      iconColor: _searchQuery == null ? theme.hintColor : null,
      onTap: () => _textController.clear(),
      iconSize: _kIconSize,
    );
  }

  void _handleSearchQueryChanges() {
    final queryText = _textController.text;

    setState(() {
      if (queryText.isEmpty) {
        _searchQuery = null;
        widget?.onSuggestions(null, null);
      } else {
        _searchQuery = normalizeText(queryText);
        widget?.onSuggestions(_buildSuggestions(_searchQuery), _searchQuery);
      }
    });
  }

  List<T> _buildSuggestions(String queryText) {
    return widget.items.where((T option) {
      if (widget.onSearchFilter != null) {
        return widget.onSearchFilter(option, queryText);
      }

      return _onSearch(option, queryText);
    }).toList();
  }

  bool _onSearch(T option, String query) {
    return normalizeText(option.label).contains(query);
  }
}
