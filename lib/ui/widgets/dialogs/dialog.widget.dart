import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kPaddingContent = EdgeInsets.symmetric(horizontal: 16.0);

class FastDialog extends AlertDialog {
  final List<Widget> children;
  final Color? titleColor;
  final String titleText;

  @override
  final List<Widget>? actions;

  @override
  final Color? backgroundColor;

  const FastDialog({
    Key? key,
    required this.titleText,
    required this.children,
    this.backgroundColor,
    this.titleColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(child: ListBody(children: children)),
      title: FastTitle(text: titleText, textColor: titleColor),
      surfaceTintColor: _getBackgroundColor(context),
      contentPadding: _kPaddingContent,
      titlePadding: kFastEdgeInsets16,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    return backgroundColor ??
        ThemeHelper.colors.getSecondaryBackgroundColor(context);
  }
}
