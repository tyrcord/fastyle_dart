import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kMarginHelper = EdgeInsets.only(top: 4.0);
const _kMargin = EdgeInsets.only(bottom: 8.0);

class FastFieldLayout extends StatelessWidget {
  final String captionText;
  final String labelText;
  final String placeholderText;
  final String helperText;
  final Widget control;
  final bool showHelperBoundaries;
  final EdgeInsets margin;

  FastFieldLayout({
    Key key,
    @required this.control,
    this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.showHelperBoundaries = true,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? _kMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (labelText != null) _buildLabel(context),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 33.0),
            child: control,
          ),
          if (showHelperBoundaries) _buildHelper(context),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    final textColor = ThemeHelper.texts.getBodyTextStyle(context).color;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: FastBody2(
            text: toBeginningOfSentenceCase(labelText),
            textColor: textColor,
          ),
        ),
        if (captionText != null)
          FastCaption(
            text: toBeginningOfSentenceCase(captionText),
          ),
      ],
    );
  }

  Widget _buildHelper(BuildContext context) {
    final hasHelper = helperText != null;

    return Opacity(
      opacity: hasHelper ? 1.0 : 0.0,
      child: Container(
        margin: _kMarginHelper,
        child: FastHelper(
          text: hasHelper
              ? toBeginningOfSentenceCase(helperText)
              : kFastEmptyString,
        ),
      ),
    );
  }
}
