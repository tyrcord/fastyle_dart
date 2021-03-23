import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

export './alert_dialog.widget.dart';
export './dialog.widget.dart';

Future<void> showFastAlertDialog({
  required BuildContext context,
  required String titleText,
  bool barrierDismissible = true,
  Color? backgroundColor,
  List<Widget>? children,
  VoidCallback? onCancel,
  List<Widget>? actions,
  VoidCallback? onValid,
  String? messageText,
  String? cancelText,
  String? validText,
  Color? titleColor,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return FastAlertDialog(
        titleText: titleText,
        cancelText: cancelText,
        validText: validText,
        titleColor: titleColor,
        actions: actions,
        backgroundColor: backgroundColor,
        onValid: onValid,
        onCancel: onCancel,
        messageText: messageText,
        children: children,
      );
    },
  );
}
