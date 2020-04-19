export './alert_dialog.widget.dart';
export './dialog.widget.dart';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

Future<void> showFastAlertDialog({
  @required BuildContext context,
  @required String titleText,
  barrierDismissible = true,
  String messageText,
  String cancelText,
  String validText,
  Color titleColor,
  List<Widget> actions,
  List<Widget> widgets,
  Color backgroundColor,
  VoidCallback onValid,
  VoidCallback onCancel,
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
        widgets: widgets,
        backgroundColor: backgroundColor,
        onValid: onValid,
        onCancel: onCancel,
        messageText: messageText,
      );
    },
  );
}
