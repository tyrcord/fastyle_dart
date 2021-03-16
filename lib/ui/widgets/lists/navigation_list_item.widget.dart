import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kDefaultTrailing = Icon(Icons.keyboard_arrow_right);

class FastNavigationListItem<T extends FastItem> extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final String? descriptionText;
  final VoidCallback onTap;
  final String? titleText;
  final Widget? leading;
  final Widget trailing;
  final bool isEnabled;
  final bool isDense;
  final T? item;

  FastNavigationListItem({
    Key? key,
    required this.onTap,
    this.trailing = _kDefaultTrailing,
    this.isEnabled = true,
    this.isDense = true,
    this.descriptionText,
    this.contentPadding,
    this.titleText,
    this.leading,
    this.item,
  })  : assert(item != null || titleText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastListItemLayout(
      contentPadding: contentPadding,
      labelText: item?.labelText ?? titleText!,
      descriptionText: item?.descriptionText ?? descriptionText,
      onTap: onTap,
      leading: item?.descriptor?.leading ?? leading,
      trailing: item?.descriptor?.trailing ?? trailing,
      isEnabled: item?.isEnabled ?? isEnabled,
      isDense: item?.descriptor?.isDense ?? isDense,
    );
  }
}
