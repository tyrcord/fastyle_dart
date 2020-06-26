import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/models/models.dart';
import 'package:flutter/material.dart';

class FastSelectableListItem<T extends FastItem> extends StatelessWidget {
  final T item;
  final String titleText;
  final String descriptionText;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isDense;
  final Widget trailing;
  final Widget leading;
  final EdgeInsets contentPadding;
  final bool isEnabled;

  FastSelectableListItem({
    Key key,
    @required this.onTap,
    this.item,
    this.titleText,
    this.descriptionText,
    this.isSelected,
    this.trailing,
    this.leading,
    this.isDense = true,
    this.isEnabled = true,
    this.contentPadding,
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
      contentPadding: contentPadding,
      titleText: titleText ?? item?.label,
      descriptionText: descriptionText ?? item?.description,
      onTap: onTap,
      leading: leading,
      trailing: isSelected ? _trailing : null,
      isEnabled: isEnabled ?? item?.isEnabled,
      isDense: isDense,
    );
  }
}
