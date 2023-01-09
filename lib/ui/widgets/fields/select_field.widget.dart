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
  final bool isEnabled;
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
    this.isEnabled = true,
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
      onTap: handleOnTap,
      child: FastFieldLayout(
        showHelperBoundaries: widget.showHelperBoundaries,
        captionText: widget.captionText,
        control: buildControl(context),
        helperText: widget.helperText,
        labelText: widget.labelText,
      ),
    );
  }

  Widget buildControl(BuildContext context) {
    return Container(
      decoration: buildBorderSide(context),
      child: Row(
        children: <Widget>[
          Expanded(child: buildLabel(context)),
          buildIcon(context),
        ],
      ),
    );
  }

  Widget buildLabel(BuildContext context) {
    if (_selection != null) {
      return FastBody(
        textColor: _getLabelColor(context),
        fontWeight: kFastFontWeightBold,
        text: _selection!.labelText,
      );
    } else if (widget.placeholderText != null) {
      return FastPlaceholder(
        textColor: _getPlaceholderColor(context),
        fontWeight: kFastFontWeightBold,
        text: widget.placeholderText!,
      );
    }

    return FastBody(
      textColor: _getLabelColor(context),
      fontWeight: kFastFontWeightBold,
      text: kFastNoneString,
    );
  }

  Widget buildIcon(BuildContext context) {
    return Icon(
      Icons.arrow_drop_down,
      color: _getLabelColor(context),
      size: kFastIconSizeMedium,
    );
  }

  BoxDecoration buildBorderSide(BuildContext context) {
    Color? color;

    if (!widget.isEnabled) {
      color = ThemeHelper.colors.getDisabledColor(context);
    }

    return ThemeHelper.createBorderSide(context, color: color);
  }

  Future<void> handleOnTap() async {
    var items = widget.items;

    if (widget.isEnabled && !widget.isReadOnly && items.isNotEmpty) {
      FocusManager.instance.primaryFocus!.unfocus();
      _focusNode.requestFocus();

      final response = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (BuildContext context) => FastSearchPage<FastItem<T>>(
            searchPlaceholderText: widget.searchPlaceholderText,
            intialCategoryIndex: widget.intialCategoryIndex,
            clearSelectionText: widget.clearSelectionText,
            canClearSelection: widget.canClearSelection,
            allCategoryText: widget.allCategoryText,
            clearSearchIcon: widget.clearSearchIcon,
            groupByCategory: widget.groupByCategory,
            useFuzzySearch: widget.useFuzzySearch,
            titleText: widget.searchTitleText,
            categories: widget.categories,
            sortItems: widget.sortItems,
            selection: widget.selection,
            closeIcon: widget.closeIcon,
            backIcon: widget.backIcon,
            items: widget.items,
          ),
          fullscreenDialog: true,
        ),
      ) as FastItem<T>?;

      setState(() {
        _selection = response;
        widget.onSelectionChanged(_selection);
      });
    }
  }

  // private methods

  /// Returns the label color based on the current state of the field.
  Color _getLabelColor(BuildContext context) {
    Color? color;

    if (!widget.isEnabled) {
      color = ThemeHelper.colors.getDisabledColor(context);
    }

    return color ?? ThemeHelper.texts.getBodyTextStyle(context).color!;
  }

  /// Returns the placeholder color based on the current state of the field.
  Color _getPlaceholderColor(BuildContext context) {
    Color? color;

    if (!widget.isEnabled) {
      color = ThemeHelper.colors.getDisabledColor(context);
    }

    return color ?? ThemeHelper.texts.getPlaceholderTextStyle(context).color!;
  }
}
