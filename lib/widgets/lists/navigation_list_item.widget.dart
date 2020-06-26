import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kDefaultTrailing = const Icon(Icons.keyboard_arrow_right);

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
    this.trailing = _kDefaultTrailing,
    this.isEnabled = true,
    this.isDense = true,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListItemLayout(
      contentPadding: contentPadding,
      titleText: titleText ?? item?.label,
      descriptionText: descriptionText ?? item?.description,
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      isEnabled: isEnabled ?? item?.isEnabled,
      isDense: isDense,
    );
  }
}
