import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

const _kIconSize = 28.0;

class FastSearchBar<T extends FastItem> extends StatefulWidget {
  final List<T> items;
  final String placeholderText;
  final Icon closeIcon;
  final Icon backIcon;
  final Icon deleteIcon;
  final bool Function(T option, String query) onSearchFilter;
  final void Function(List<T> _suggestions, String query) onSuggestions;
  final VoidCallback onLeadingButtonTap;
  final bool showLeadingIcon;

  FastSearchBar({
    @required this.items,
    this.placeholderText,
    this.closeIcon,
    this.backIcon,
    this.deleteIcon,
    this.onSearchFilter,
    this.onSuggestions,
    this.onLeadingButtonTap,
    this.showLeadingIcon = true,
  }) : super();

  @override
  _FastSearchBarState createState() => _FastSearchBarState<T>();
}

class _FastSearchBarState<T extends FastItem> extends State<FastSearchBar<T>> {
  TextEditingController _textEditingController = TextEditingController();
  String _searchQuery;

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
          _buildDeleteIcon(context),
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
        FocusScope.of(context).requestFocus(FocusNode());
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
              widget.onSuggestions(null, null);
              _clearState();
            });
          },
          iconSize: _kIconSize,
        );
  }

  void _buildSuggestions(String query) {
    if (widget.onSuggestions != null) {
      final suggestions = widget.items.where((T option) {
        if (widget.onSearchFilter != null) {
          return widget.onSearchFilter(option, query);
        }

        return _onSearch(option, query);
      }).toList();

      widget.onSuggestions(suggestions, query);
    }
  }

  void _clearState() {
    _searchQuery = null;
    widget.onSuggestions(null, null);
  }

  bool _onSearch(T option, String query) {
    return normalizeText(option.label).contains(query);
  }
}
