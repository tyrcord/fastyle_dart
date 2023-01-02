import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FastListItemLayout extends StatelessWidget {
  ///
  /// Describes some additional visual aspects of an item.
  ///
  final FastListItemDescriptor? descriptor;

  ///
  /// The padding for the input decoration's container.
  ///
  final EdgeInsets? contentPadding;

  ///
  /// Allow to convert the label to beginning of sentence case.
  ///
  final bool capitalizeLabelText;

  ///
  /// Text that describes an item description.
  ///
  final String? descriptionText;

  ///
  /// Called for each distinct tap.
  ///
  final VoidCallback? onTap;

  ///
  /// Text that describes an item label.
  ///
  final String labelText;

  ///
  /// A widget to display after an item label.
  ///
  final Widget? trailing;

  ///
  /// A widget to display before an item label.
  ///
  final Widget? leading;

  ///
  /// Indicates whether an item is enabled in the user interface.
  ///
  final bool isEnabled;

  ///
  /// Specifies whether an item will have the vertically dense layout.
  ///
  final bool isDense;

  final Color? selectionLabelColor;

  final Color? selectionColor;

  FastListItemLayout({
    Key? key,
    required this.labelText,
    this.capitalizeLabelText = true,
    this.isEnabled = true,
    this.isDense = true,
    this.selectionLabelColor,
    this.descriptionText,
    this.contentPadding,
    this.selectionColor,
    this.descriptor,
    this.trailing,
    this.leading,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? subtitle;

    if (descriptionText != null) {
      subtitle = FastSecondaryBody(text: descriptionText!);
    }

    return ThemeHelper.getListTitleTheme(
      context: context,
      child: Container(
        color: selectionColor,
        child: ListTile(
          trailing: descriptor?.trailing ?? trailing,
          leading: descriptor?.leading ?? leading,
          dense: descriptor?.isDense ?? isDense,
          contentPadding: contentPadding,
          minLeadingWidth: 16.0,
          title: _buildTitle(),
          subtitle: subtitle,
          enabled: isEnabled,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    final _labelText =
        capitalizeLabelText ? toBeginningOfSentenceCase(labelText)! : labelText;

    return FastBody(textColor: selectionLabelColor, text: _labelText);
  }
}
