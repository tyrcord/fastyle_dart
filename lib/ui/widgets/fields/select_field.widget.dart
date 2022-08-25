import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastSelectField<T> extends StatefulWidget {
  final ValueChanged<FastItem<T>?> onSelectionChanged;
  final List<FastCategory>? categories;
  final String searchPlaceholderText;
  final String clearSelectionText;
  final bool showHelperBoundaries;
  final String? placeholderText;
  final List<FastItem<T>> items;
  final int intialCategoryIndex;
  final String? allCategoryText;
  final FastItem<T>? selection;
  final Widget clearSearchIcon;
  final bool canClearSelection;
  final String searchTitleText;
  final bool groupByCategory;
  final bool useFuzzySearch;
  final String? captionText;
  final String? helperText;
  final String labelText;
  final Widget closeIcon;
  final Widget backIcon;
  final bool isReadOnly;
  final bool sortItems;

  FastSelectField({
    Key? key,
    required this.onSelectionChanged,
    required this.labelText,
    required this.items,
    this.searchPlaceholderText = kFastSearchPlaceholderText,
    this.clearSelectionText = kFastClearSelectionText,
    this.clearSearchIcon = kFastClearSearchIcon,
    this.searchTitleText = kFastSelectTitleText,
    this.showHelperBoundaries = true,
    this.closeIcon = kFastCloseIcon,
    this.backIcon = kFastBackIcon,
    this.canClearSelection = true,
    this.intialCategoryIndex = 0,
    this.groupByCategory = false,
    this.useFuzzySearch = false,
    this.isReadOnly = false,
    this.sortItems = true,
    this.placeholderText,
    this.allCategoryText,
    this.captionText,
    this.helperText,
    this.categories,
    this.selection,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSelectFieldState<T>();
}

class _FastSelectFieldState<T> extends State<FastSelectField<T>> {
  late FocusNode _focusNode;
  FastItem<T>? _selection;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _selection = widget.selection;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FastSelectField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selection != oldWidget.selection) {
      setState(() => _selection = widget.selection);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var items = widget.items;

        if (!widget.isReadOnly && items.isNotEmpty) {
          FocusManager.instance.primaryFocus!.unfocus();
          _focusNode.requestFocus();

          final response = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => FastSearchPage<FastItem<T>>(
                titleText: widget.searchTitleText,
                items: widget.items,
                groupByCategory: widget.groupByCategory,
                categories: widget.categories,
                selection: widget.selection,
                useFuzzySearch: widget.useFuzzySearch,
                sortItems: widget.sortItems,
                searchPlaceholderText: widget.searchPlaceholderText,
                intialCategoryIndex: widget.intialCategoryIndex,
                allCategoryText: widget.allCategoryText,
                clearSearchIcon: widget.clearSearchIcon,
                backIcon: widget.backIcon,
                closeIcon: widget.closeIcon,
                canClearSelection: widget.canClearSelection,
                clearSelectionText: widget.clearSelectionText,
              ),
              fullscreenDialog: true,
            ),
          ) as FastItem<T>?;

          setState(() {
            _selection = response;
            widget.onSelectionChanged(_selection);
          });
        }
      },
      child: FastFieldLayout(
        showHelperBoundaries: widget.showHelperBoundaries,
        labelText: widget.labelText,
        captionText: widget.captionText,
        helperText: widget.helperText,
        control: _buildControl(context),
      ),
    );
  }

  Widget _buildControl(BuildContext context) {
    final text = _selection != null
        ? FastBody(text: _selection!.labelText, fontWeight: kFastFontWeightBold)
        : widget.placeholderText != null
            ? FastPlaceholder(
                text: widget.placeholderText!,
                fontWeight: kFastFontWeightBold,
              )
            : const FastBody(
                text: kFastNoneString,
                fontWeight: kFastFontWeightBold,
              );

    return Container(
      decoration: ThemeHelper.createBorderSide(context),
      child: Row(
        children: <Widget>[
          Expanded(child: text),
          Icon(
            Icons.arrow_drop_down,
            color: ThemeHelper.texts.getBodyTextStyle(context).color,
            size: kFastIconSizeMedium,
          ),
        ],
      ),
    );
  }
}
