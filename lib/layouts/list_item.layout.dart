import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastListItemLayout extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final VoidCallback onTap;
  final Widget leading;
  final Widget trailing;
  final bool isEnabled;
  final bool isDense;
  final FastListTileDescriptor descriptor;

  FastListItemLayout({
    Key key,
    @required this.titleText,
    this.onTap,
    this.descriptionText,
    this.leading,
    this.trailing,
    this.isEnabled = true,
    this.isDense,
    this.descriptor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeHelper.getListTitleTheme(
      context: context,
      child: ListTile(
        dense: isDense ?? descriptor?.isDense ?? true,
        enabled: isEnabled,
        leading: leading ?? descriptor?.leading,
        title: FastBody(text: titleText),
        subtitle:
            descriptionText != null ? FastBody2(text: descriptionText) : null,
        trailing: trailing ?? descriptor?.trailing,
        onTap: onTap,
      ),
    );
  }
}
