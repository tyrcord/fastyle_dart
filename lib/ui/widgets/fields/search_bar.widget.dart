import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/data/result.dart';
import 'package:fuzzy/fuzzy.dart';

const _kIconSize = 24.0;

class FastSearchBar<T extends FastItem> extends StatefulWidget {
  final List<T> items;
  final String? placeholderText;
  final Widget? closeIcon;
  final Widget? backIcon;
  final Widget? clearSearchIcon;
  final bool Function(T option, String? query)? onSearchFilter;
  final void Function(List<T>? suggestions, String? query)? onSuggestions;
  final VoidCallback? onLeadingButtonTap;
  final bool showLeadingIcon;
  final TextEditingController? textEditingController;
  final bool shouldUseFuzzySearch;
  final bool showShowBottomBorder;

  FastSearchBar({
    required this.items,
    this.placeholderText,
    this.closeIcon,
    this.backIcon,
    this.clearSearchIcon,
    this.onSearchFilter,
    this.onSuggestions,
    this.onLeadingButtonTap,
    this.textEditingController,
    this.showLeadingIcon = true,
    this.shouldUseFuzzySearch = false,
    this.showShowBottomBorder = true,
  }) : super();

  @override
  _FastSearchBarState createState() => _FastSearchBarState<T>();
}

class _FastSearchBarState<T extends FastItem> extends State<FastSearchBar<T>> {
  late TextEditingController _textController;
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _textController = widget.textEditingController ?? TextEditingController();
    _textController.addListener(_handleSearchQueryChanges);
  }

  @override
  void dispose() {
    _textController.removeListener(_handleSearchQueryChanges);
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _buildSearchAppBar(context);

  Widget _buildSearchAppBar(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: widget.showShowBottomBorder
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: ThemeHelper.borderSize,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            )
          : null,
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
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final closeIcon = widget.closeIcon ?? Icon(Icons.close);
    final backIcon = widget.backIcon ?? Icon(Icons.arrow_back);

    return FastIconButton(
      icon: useCloseButton ? closeIcon : backIcon,
      onTap: () {
        if (widget.onLeadingButtonTap != null) {
          widget.onLeadingButtonTap!();
        }
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
      ),
    );
  }

  Widget _buildClearIcon(BuildContext context) {
    final theme = Theme.of(context);

    return FastIconButton(
      icon: widget.clearSearchIcon ?? const Icon(Icons.delete_outline),
      iconColor: _searchQuery == null ? theme.hintColor : null,
      onTap: () => _textController.clear(),
      iconSize: _kIconSize,
    );
  }

  void _handleSearchQueryChanges() {
    final queryText = _textController.text;

    if (queryText != _searchQuery && widget.onSuggestions != null) {
      setState(() {
        if (queryText.isEmpty) {
          _searchQuery = null;
          widget.onSuggestions!(null, null);
        } else {
          _searchQuery = normalizeTextByRemovingDiacritics(queryText);
          widget.onSuggestions!(_buildSuggestions(_searchQuery), _searchQuery);
        }
      });
    }
  }

  List<T> _buildSuggestions(String? queryText) {
    if (widget.shouldUseFuzzySearch) {
      return _buildFuzzySuggestions(queryText!);
    }

    return widget.items.where((T option) {
      if (widget.onSearchFilter != null) {
        return widget.onSearchFilter!(option, queryText);
      }

      return normalizeTextByRemovingDiacritics(option.labelText)
              .contains(queryText!) ||
          (option.descriptionText != null
              ? normalizeTextByRemovingDiacritics(option.descriptionText!)
                  .contains(queryText)
              : false);
    }).toList();
  }

  List<T> _buildFuzzySuggestions(String queryText) {
    final fuse = Fuzzy(widget.items, options: kFastFastItemFuzzyOptions);
    final results = <T>[];

    // TODO: workaround https://github.com/comigor/fuzzy/issues/8
    final rawResults = fuse.search(queryText);
    rawResults.forEach((r) => r.score = r.matches[0].score);
    rawResults.sort((a, b) => a.score.compareTo(b.score));

    rawResults.forEach((Result<dynamic> result) {
      results.add(result.item as T);
    });

    return results;
  }
}
