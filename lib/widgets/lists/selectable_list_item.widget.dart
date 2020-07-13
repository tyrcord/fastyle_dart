import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:fastyle_dart/models/models.dart';
import 'package:flutter/material.dart';

const _defaultIcon = Icon(Icons.done);

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
    final _color = ThemeHelper.colors.getPrimaryColor(context);
    Widget _trailing = trailing ?? item.descriptor?.trailing ?? _defaultIcon;

    if (_trailing is Icon) {
      final icon = _trailing as Icon;

      _trailing = Icon(
        icon.icon,
        color: _color,
        size: icon.size,
      );
    }

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
