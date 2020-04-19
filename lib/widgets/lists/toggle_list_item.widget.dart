import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastToggleListItem extends StatefulWidget {
  final String titleText;
  final String descriptionText;
  final ValueChanged<bool> onValueChanged;
  final Widget leading;
  final bool isEnabled;
  final bool isChecked;
  final bool isDense;

  FastToggleListItem({
    Key key,
    @required this.titleText,
    @required this.onValueChanged,
    this.descriptionText,
    this.leading,
    this.isEnabled = true,
    this.isDense = true,
    this.isChecked = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FastToggleListItemState();
}

class _FastToggleListItemState extends State<FastToggleListItem> {
  bool _value;

  @override
  void initState() {
    _value = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeHelper.getListTitleTheme(
      context: context,
      child: SwitchListTile.adaptive(
        activeColor: ThemeHelper.colors.getPrimaryColor(context),
        inactiveTrackColor: ThemeHelper.colors.getHintColor(context),
        dense: widget.isDense,
        title: FastBody(
          text: widget.titleText,
        ),
        subtitle: widget.descriptionText != null
            ? FastBody2(text: widget.descriptionText)
            : null,
        onChanged: (bool value) {
          if (widget.isEnabled) {
            setState(() {
              _value = value;
              widget.onValueChanged(value);
            });
          }
        },
        secondary: widget.leading,
        value: _value,
      ),
    );
  }
}
