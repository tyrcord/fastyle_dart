import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastToggleListItem<T extends FastItem> extends StatefulWidget {
  final T? item;
  final String? titleText;
  final String? descriptionText;
  final ValueChanged<bool> onValueChanged;
  final Widget? leading;
  final bool isEnabled;
  final bool isChecked;
  final bool isDense;

  FastToggleListItem({
    Key? key,
    required this.onValueChanged,
    this.item,
    this.titleText,
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
  late bool _value;

  @override
  void didUpdateWidget(covariant FastToggleListItem<FastItem> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isChecked != widget.isChecked) {
      setState(() => _value = widget.isChecked);
    }
  }

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
          text: (widget.titleText ?? widget.item?.labelText)!,
        ),
        subtitle: widget.descriptionText != null
            ? FastBody2(
                text:
                    (widget.descriptionText ?? widget.item?.descriptionText!)!,
              )
            : null,
        onChanged: (bool value) {
          if (widget.item?.isEnabled ?? true && widget.isEnabled) {
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
