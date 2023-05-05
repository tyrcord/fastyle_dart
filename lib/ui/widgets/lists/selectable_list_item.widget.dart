import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        _trailing = _getTrailingIcon(context);
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

  Widget _getTrailingIcon(BuildContext context) {
    var icon = item?.descriptor?.trailing ?? trailing ?? kFastDoneIcon;

    if (icon is Icon) {
      icon = Icon(
        color: _getSelectionTrailingColor(context),
        size: icon.size,
        icon.icon,
      );
    } else if (icon is FaIcon) {
      icon = FaIcon(
        icon.icon,
        color: _getSelectionTrailingColor(context),
        size: icon.size,
      );
    }

    return icon;
  }

  Color _getSelectionTrailingColor(BuildContext context) {
    final colors = ThemeHelper.colors;

    return selectionTralingColor ?? colors.getPrimaryColor(context);
  }
}
