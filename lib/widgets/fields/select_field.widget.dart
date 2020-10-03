import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _kIconSize = 24.0;

class FastSelectField<T> extends StatefulWidget {
  final ValueChanged<FastItem<T>> onSelectionChanged;
  final String labelText;
  final String captionText;
  final String placeholderText;
  final String helperText;
  final bool isReadOnly;
  final FastItem<T> selection;
  final List<FastItem<T>> items;
  final List<FastCategory> categories;
  final bool shouldGroupByCategory;
  final bool shouldUseFuzzySearch;
  final bool shouldSortItems;
  final String titleText;
  final String searchPlaceholderText;
  final int intialTabIndex;
  final String tabAllCategoryText;
  final Widget clearSearchIcon;
  final Widget closeIcon;
  final Widget backIcon;

  FastSelectField({
    Key key,
    @required this.labelText,
    @required this.items,
    this.selection,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.onSelectionChanged,
    bool isReadOnly = false,
    bool shouldGroupByCategory = false,
    bool shouldUseFuzzySearch = false,
    bool shouldSortItems = true,
    this.titleText,
    this.categories,
    this.searchPlaceholderText,
    this.intialTabIndex,
    this.tabAllCategoryText,
    this.clearSearchIcon,
    this.closeIcon,
    this.backIcon,
  })  : assert(labelText != null),
        assert(items != null),
        shouldSortItems = shouldSortItems ?? true,
        this.isReadOnly = isReadOnly ?? false,
        this.shouldGroupByCategory = shouldGroupByCategory ?? false,
        this.shouldUseFuzzySearch = shouldUseFuzzySearch ?? false,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSelectFieldState<T>();
}

class _FastSelectFieldState<T> extends State<FastSelectField<T>> {
  FocusNode _focusNode;
  FastItem<T> _selection;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
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
      child: FastFieldLayout(
        labelText: widget.labelText,
        captionText: widget.captionText,
        helperText: widget.helperText,
        control: _buildControl(context),
      ),
      onTap: () async {
        var items = widget.items;

        if (!widget.isReadOnly && items != null && items.isNotEmpty) {
          FocusScope.of(context).requestFocus(_focusNode);

          final response = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => FastSearchPage(
                titleText: widget.titleText,
                items: widget.items,
                shouldGroupByCategory: widget.shouldGroupByCategory,
                categories: widget.categories,
                selection: widget.selection,
                shouldUseFuzzySearch: widget.shouldUseFuzzySearch,
                shouldSortItems: widget.shouldSortItems,
                placeholderText: widget.searchPlaceholderText,
                intialTabIndex: widget.intialTabIndex,
                tabAllCategoryText: widget.tabAllCategoryText,
                clearSearchIcon: widget.clearSearchIcon,
                backIcon: widget.backIcon,
                closeIcon: widget.closeIcon,
              ),
              fullscreenDialog: true,
            ),
          );

          setState(() {
            _selection = response;

            if (widget.onSelectionChanged != null) {
              widget.onSelectionChanged(_selection);
            }
          });
        }
      },
    );
  }

  Widget _buildControl(BuildContext context) {
    final text = _selection != null
        ? FastBody(text: _selection.labelText, fontWeight: FontWeight.w700)
        : widget.placeholderText != null
            ? FastPlaceholder(
                text: widget.placeholderText,
                fontWeight: FontWeight.w700,
              )
            : FastBody(text: kFastNoneString, fontWeight: FontWeight.w700);

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(child: text),
          Icon(
            Icons.arrow_drop_down,
            color: ThemeHelper.texts.getBodyTextStyle(context).color,
            size: _kIconSize,
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(
            context,
            color: Theme.of(context)
                .inputDecorationTheme
                .enabledBorder
                .borderSide
                .color,
            width: kFastBorderSize,
          ),
        ),
      ),
    );
  }
}
