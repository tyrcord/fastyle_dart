import 'package:fastyle_dart/fastyle_dart.dart';
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
    bool isDense = true,
    bool isEnabled = true,
    this.contentPadding,
  })  : assert(onTap != null),
        isDense = isDense ?? true,
        isEnabled = isEnabled ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = ThemeHelper.colors.getPrimaryColor(context);
    var _trailing = trailing ?? item.descriptor?.trailing ?? _defaultIcon;

    if (_trailing is Icon) {
      final icon = _trailing as Icon;
      _trailing = Icon(icon.icon, color: _color, size: icon.size);
    }

    return FastListItemLayout(
      contentPadding: contentPadding,
      titleText: item?.labelText ?? titleText,
      descriptionText: item?.descriptionText ?? descriptionText,
      onTap: onTap,
      leading: item?.descriptor?.leading ?? leading,
      trailing: isSelected ? _trailing : null,
      isEnabled: item?.isEnabled ?? isEnabled,
      isDense: item?.descriptor?.isDense ?? isDense,
    );
  }
}
