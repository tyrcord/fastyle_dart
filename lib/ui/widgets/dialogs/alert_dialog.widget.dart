import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kValidText = 'valid';
const _kCancelText = 'cancel';

class FastAlertDialog extends AlertDialog {
  final VoidCallback? onCancel;
  final List<Widget>? widgets;
  final VoidCallback? onValid;
  final String? messageText;
  final Color? messageColor;
  final String? cancelText;
  final String? validText;
  final Color? titleColor;
  final String titleText;

  @override
  final Color? backgroundColor;

  @override
  final List<Widget>? actions;

  FastAlertDialog({
    Key? key,
    required this.titleText,
    this.backgroundColor,
    this.messageColor,
    this.messageText,
    this.cancelText,
    this.titleColor,
    this.validText,
    this.onCancel,
    this.widgets,
    this.actions,
    this.onValid,
  })  : assert(messageText == null || widgets == null),
        assert(messageText != null || widgets != null),
        assert(actions == null || cancelText == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastDialog(
      titleText: titleText,
      widgets: widgets ?? _buildDefaultContent(),
      titleColor: titleColor,
      backgroundColor: backgroundColor,
      actions: actions ?? _buildDefaultActions(context),
    );
  }

  List<Widget> _buildDefaultContent() {
    return [FastBody(text: messageText!, textColor: messageColor)];
  }

  List<Widget> _buildDefaultActions(BuildContext context) {
    return [
      if (onCancel != null)
        FastTextButton(
          text: cancelText ?? _kCancelText,
          onTap: onCancel!,
        ),
      FastTextButton(
        onTap: () {
          if (onValid != null) {
            onValid!();
          } else {
            Navigator.pop(context);
          }
        },
        text: validText ?? _kValidText,
        emphasis: FastButtonEmphasis.high,
      ),
    ];
  }
}
