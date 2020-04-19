import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FastSegmentField<T> extends StatefulWidget {
  final ValueChanged<FastItem<T>> onValueChanged;
  final List<FastItem<T>> options;
  final String labelText;
  final String captionText;
  final bool isReadOnly;

  FastSegmentField({
    Key key,
    @required this.labelText,
    @required this.options,
    this.captionText,
    this.onValueChanged,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastSegmentFieldState<T>();
}

class _FastSegmentFieldState<T> extends State<FastSegmentField<T>> {
  Map<int, FastItem<T>> _options;
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    _options = widget.options.asMap();
    super.initState();
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
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.only(top: 9),
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
    final primaryColor = Theme.of(context).primaryColor;

    return _options.map((int index, FastItem<T> item) {
      return MapEntry(
        index,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: FastBody(
            text: item.label,
            textColor: _selectedIndex == index
                ? ThemeHelper.colors.getWhiteColor(context)
                : primaryColor,
          ),
        ),
      );
    });
  }
}
