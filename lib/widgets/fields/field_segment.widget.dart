import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastSegmentField<T> extends StatefulWidget {
  final ValueChanged<FastItem<T>> onValueChanged;
  final List<FastItem<T>> options;
  final String labelText;
  final String captionText;
  final bool isReadOnly;
  final int selectedIndex;

  FastSegmentField({
    Key key,
    @required this.labelText,
    @required this.options,
    this.captionText,
    this.onValueChanged,
    bool isReadOnly = false,
    this.selectedIndex = 0,
  })  : isReadOnly = isReadOnly ?? false,
        assert(options != null),
        assert(labelText != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSegmentFieldState<T>();
}

class _FastSegmentFieldState<T> extends State<FastSegmentField<T>> {
  Map<int, FastItem<T>> _options;
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    _options = widget.options.asMap();
    super.initState();
  }

  @override
  void didUpdateWidget(FastSegmentField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedIndex != oldWidget.selectedIndex) {
      setState(() => _selectedIndex = widget.selectedIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      labelText: widget.labelText,
      captionText: widget.captionText,
      showHelperBoundaries: true,
      control: _buildControl(context),
    );
  }

  Widget _buildControl(BuildContext context) {
    final primaryColor = ThemeHelper.colors.getPrimaryColor(context);

    return Container(
      padding: const EdgeInsets.only(top: 9),
      child: CupertinoSegmentedControl(
        borderColor: primaryColor,
        selectedColor: primaryColor,
        unselectedColor: Colors.transparent,
        pressedColor: primaryColor.withOpacity(0.25),
        padding: EdgeInsets.zero,
        children: _buildSegements(context),
        groupValue: _selectedIndex,
        onValueChanged: (int index) {
          setState(() {
            _selectedIndex = index;
            widget.onValueChanged(_options[index]);
          });
        },
      ),
    );
  }

  Map<int, Padding> _buildSegements(BuildContext context) {
    return _options.map((int index, FastItem<T> item) {
      return MapEntry(
        index,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FastBody(
            text: item.labelText,
            textColor: _selectedIndex == index
                ? ThemeHelper.colors.getWhiteColor(context)
                : ThemeHelper.colors.getPrimaryColor(context),
          ),
        ),
      );
    });
  }
}
