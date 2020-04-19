import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/models/models.dart';
import 'package:flutter/material.dart';

class FastSelectableListItem extends StatelessWidget {
  final FastItem item;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isDense;
  final Widget trailing;
  final Widget leading;

  FastSelectableListItem({
    Key key,
    @required this.item,
    @required this.onTap,
    this.isSelected,
    this.trailing,
    this.leading,
    this.isDense = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _trailing = trailing ??
        item.descriptor?.trailing ??
        Icon(
          Icons.done,
          color: ThemeHelper.colors.getPrimaryColor(context),
        );

    return FastListItemLayout(
      titleText: item.label,
      onTap: onTap,
      descriptionText: item.description,
      leading: leading,
      trailing: isSelected ? _trailing : null,
      isEnabled: item.isEnabled,
      isDense: isDense,
    );
  }
}
