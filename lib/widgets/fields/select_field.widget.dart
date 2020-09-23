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
    this.categories,
  })  : assert(labelText != null),
        assert(items != null),
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
        if (!widget.isReadOnly) {
          FocusScope.of(context).requestFocus(_focusNode);

          final response = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => FastSearchPage(
                items: widget.items,
                shouldGroupByCategory: widget.shouldGroupByCategory,
                categories: widget.categories,
                selection: widget.selection,
                shouldUseFuzzySearch: widget.shouldUseFuzzySearch,
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
        ? FastBody(text: _selection.labelText)
        : widget.placeholderText != null
            ? FastPlaceholder(text: widget.placeholderText)
            : FastBody(text: kFastNoneString);

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
