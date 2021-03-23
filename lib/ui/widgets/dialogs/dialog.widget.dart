import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kPaddingContent = EdgeInsets.symmetric(horizontal: 16.0);

class FastDialog extends AlertDialog {
  final List<Widget> widgets;
  final Color? titleColor;
  final String titleText;

  @override
  final List<Widget>? actions;

  @override
  final Color? backgroundColor;

  FastDialog({
    Key? key,
    required this.titleText,
    required this.widgets,
    this.backgroundColor,
    this.titleColor,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: FastTitle(text: titleText, textColor: titleColor),
      titlePadding: kFastEdgeInsets16,
      contentPadding: _kPaddingContent,
      content: SingleChildScrollView(child: ListBody(children: widgets)),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }
}
