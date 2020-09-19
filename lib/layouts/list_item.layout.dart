import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

final _kTransform = Matrix4.translationValues(-16, 0.0, 0.0);

class FastListItemLayout extends StatelessWidget {
  final FastListItemDescriptor descriptor;
  final EdgeInsets contentPadding;
  final String descriptionText;
  final VoidCallback onTap;
  final String titleText;
  final Widget trailing;
  final Widget leading;
  final bool isEnabled;
  final bool isDense;

  FastListItemLayout({
    Key key,
    @required this.titleText,
    this.isEnabled = true,
    this.descriptionText,
    this.contentPadding,
    this.descriptor,
    this.trailing,
    this.isDense,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = FastBody(text: titleText);

    return ThemeHelper.getListTitleTheme(
      context: context,
      child: ListTile(
        contentPadding: contentPadding,
        dense: isDense ?? descriptor?.isDense ?? true,
        enabled: isEnabled,
        leading: leading ?? descriptor?.leading,
        title: leading != null
            ? Transform(transform: _kTransform, child: title)
            : title,
        subtitle: descriptionText != null
            ? Transform(
                transform: _kTransform,
                child: FastBody2(text: descriptionText),
              )
            : null,
        trailing: trailing ?? descriptor?.trailing,
        onTap: onTap,
      ),
    );
  }
}
