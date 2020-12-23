import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kDefaultTrailing = Icon(Icons.keyboard_arrow_right);

class FastNavigationListItem<T extends FastItem> extends StatelessWidget {
  final T item;
  final String titleText;
  final String descriptionText;
  final VoidCallback onTap;
  final Widget leading;
  final Widget trailing;
  final bool isEnabled;
  final bool isDense;
  final EdgeInsets contentPadding;

  FastNavigationListItem({
    Key key,
    @required this.onTap,
    this.item,
    this.titleText,
    this.descriptionText,
    this.leading,
    Icon trailing = _kDefaultTrailing,
    bool isEnabled = true,
    bool isDense = true,
    this.contentPadding,
  })  : trailing = trailing ?? _kDefaultTrailing,
        isEnabled = isEnabled ?? true,
        isDense = isDense ?? true,
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListItemLayout(
      contentPadding: contentPadding,
      titleText: item?.labelText ?? titleText,
      descriptionText: item?.descriptionText ?? descriptionText,
      onTap: onTap,
      leading: item?.descriptor?.leading ?? leading,
      trailing: item?.descriptor?.trailing ?? trailing,
      isEnabled: item?.isEnabled ?? isEnabled,
      isDense: item?.descriptor?.isDense ?? isDense,
    );
  }
}
