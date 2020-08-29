import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kValidText = 'valid';
const _kCancelText = 'cancel';

class FastAlertDialog extends FastDialog {
  final String titleText;
  final String cancelText;
  final String validText;
  final String messageText;
  final Color titleColor;
  final Color messageColor;
  final List<Widget> actions;
  final List<Widget> widgets;
  final Color backgroundColor;
  final VoidCallback onValid;
  final VoidCallback onCancel;

  FastAlertDialog({
    Key key,
    @required this.titleText,
    this.widgets,
    this.titleColor,
    this.messageText,
    this.actions,
    this.backgroundColor,
    this.cancelText,
    this.validText,
    this.onCancel,
    this.onValid,
    this.messageColor,
  })  : assert(messageText == null || widgets == null),
        assert(actions == null || cancelText == null);

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
    return [
      FastBody(
        text: messageText,
        textColor: messageColor,
      ),
    ];
  }

  List<Widget> _buildDefaultActions(BuildContext context) {
    final cancelText = this.cancelText ?? _kCancelText;

    return [
      if (onCancel != null && cancelText != null)
        FastTextButton(
          onTap: onCancel,
          text: cancelText ?? _kCancelText,
        ),
      FastTextButton(
        onTap: () {
          if (onValid != null) {
            onValid();
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
