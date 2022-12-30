import 'package:fastyle_dart/ui/ui.dart';
import 'package:flutter/material.dart';

/// The default badge text.
const _kBadgeText = 'Badge';

/// The default badge padding.
const _kBadgePadding = EdgeInsets.symmetric(horizontal: 12, vertical: 4);

/// A badge widget that can be used to display a small amount of information.
class FastBadge extends StatelessWidget {
  /// The padding.
  final EdgeInsetsGeometry? padding;

  /// The background color.
  final Color? backgroundColor;

  /// The text color.
  final Color? textColor;

  /// The text to display.
  final String? text;

  /// The border radius.
  final BorderRadius? borderRadius;

  const FastBadge({
    super.key,
    this.padding = _kBadgePadding,
    this.text = _kBadgeText,
    this.backgroundColor,
    this.borderRadius,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: buildDecoration(context),
      child: Center(child: buildText(context)),
    );
  }

  /// Returns the decoration.
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: _getBackgroundColor(context),
      borderRadius: _getBorderRadius(),
      shape: BoxShape.rectangle,
    );
  }

  /// Returns the text.
  Widget buildText(BuildContext context) {
    return FastOverline(
      textColor: _getTextColor(context),
      text: text ?? _kBadgeText,
    );
  }

  /// Returns the background color.
  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) {
      return backgroundColor!;
    }

    final colors = ThemeHelper.colors;

    return colors.getPrimaryColor(context).withAlpha(155);
  }

  /// Returns the padding.
  EdgeInsetsGeometry _getPadding() {
    return padding != null ? padding! : _kBadgePadding;
  }

  /// Returns the text color.
  Color _getTextColor(BuildContext context) {
    if (textColor != null) {
      return textColor!;
    }

    final colors = ThemeHelper.colors;

    return colors.getPrimaryColor(context);
  }

  /// Returns the border radius.
  BorderRadius _getBorderRadius() {
    return borderRadius != null ? borderRadius! : BorderRadius.circular(16);
  }
}
