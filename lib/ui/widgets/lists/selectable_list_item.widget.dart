import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSelectableListItem<T extends FastItem> extends StatelessWidget {
  final EdgeInsets? contentPadding;

  ///
  /// Allow to convert the label to beginning of sentence case.
  ///
  final Color? selectionTralingColor;
  final Color? selectionLabelColor;
  final bool capitalizeLabelText;
  final String? descriptionText;
  final Color? selectionColor;
  final VoidCallback onTap;
  final String? labelText;
  final Widget? trailing;
  final bool isSelected;
  final Widget? leading;
  final bool isEnabled;
  final bool isDense;
  final T? item;

  FastSelectableListItem({
    Key? key,
    required this.onTap,
    this.capitalizeLabelText = true,
    this.isSelected = false,
    this.isEnabled = true,
    this.isDense = true,
    this.selectionTralingColor,
    this.selectionLabelColor,
    this.descriptionText,
    this.contentPadding,
    this.selectionColor,
    this.labelText,
    this.trailing,
    this.leading,
    this.item,
  })  : assert(item?.labelText != null || labelText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? _selectionLabelColor;
    Color? _selectionColor;
    Widget? _trailing;

    if (isSelected) {
      final palette = ThemeHelper.getPaletteColors(context);
      final colors = ThemeHelper.colors;

      if (selectionColor != null) {
        _selectionColor = selectionColor ?? colors.getPrimaryColor(context);
        _selectionLabelColor = selectionLabelColor ?? palette.whiteColor;
        _trailing = null;
      } else {
        // TODO: we need to think again the default trailing icon
        // since we can have a selection color.
        _trailing = item?.descriptor?.trailing ?? trailing ?? kFastDoneIcon;

        if (_trailing is Icon) {
          final icon = _trailing;

          _trailing = Icon(
            color: selectionTralingColor ?? colors.getPrimaryColor(context),
            size: icon.size,
            icon.icon,
          );
        }
      }
    }

    return FastListItemLayout(
      descriptionText: item?.descriptionText ?? descriptionText,
      leading: item?.descriptor?.leading ?? leading,
      isDense: item?.descriptor?.isDense ?? isDense,
      selectionLabelColor: _selectionLabelColor,
      labelText: item?.labelText ?? labelText!,
      capitalizeLabelText: capitalizeLabelText,
      isEnabled: item?.isEnabled ?? isEnabled,
      selectionColor: _selectionColor,
      contentPadding: contentPadding,
      trailing: _trailing,
      onTap: onTap,
    );
  }
}
