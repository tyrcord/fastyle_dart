import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kDefaultTrailing = const Icon(Icons.keyboard_arrow_right);

class FastNavigationListItem extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;
  final String descriptionText;
  final Widget leading;
  final Widget trailing;
  final bool isEnabled;
  final bool isDense;

  FastNavigationListItem({
    Key key,
    @required this.titleText,
    @required this.onTap,
    this.descriptionText,
    this.leading,
    this.trailing = _kDefaultTrailing,
    this.isEnabled = true,
    this.isDense = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListItemLayout(
      titleText: titleText,
      onTap: onTap,
      descriptionText: descriptionText,
      leading: leading,
      trailing: trailing,
      isEnabled: isEnabled,
      isDense: isDense,
    );
  }
}
