import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastFieldLayout extends StatelessWidget {
  final String captionText;
  final String labelText;
  final String placeholderText;
  final String helperText;
  final Widget control;
  final bool showHelperBoundaries;
  final EdgeInsets margin;
  final Color helperTextColor;
  final Widget suffixIcon;

  FastFieldLayout({
    Key key,
    @required this.control,
    this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    bool showHelperBoundaries = true,
    this.margin,
    this.helperTextColor,
    this.suffixIcon,
  })  : showHelperBoundaries = showHelperBoundaries ?? true,
        assert(control != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (labelText != null) _buildLabel(context),
          Stack(
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 33.0),
                child: control,
              ),
              if (suffixIcon != null)
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: suffixIcon,
                )
            ],
          ),
          if (showHelperBoundaries) _buildHelper(context),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: FastBody2(
              text: toBeginningOfSentenceCase(labelText),
              textColor: ThemeHelper.texts.getBodyTextStyle(context).color,
            ),
          ),
        ),
        if (captionText != null)
          FastCaption(text: toBeginningOfSentenceCase(captionText)),
      ],
    );
  }

  Widget _buildHelper(BuildContext context) {
    final hasHelper = helperText != null;

    return Opacity(
      opacity: hasHelper ? 1.0 : 0.0,
      child: Container(
        margin: const EdgeInsets.only(top: 4.0),
        child: FastHelper(
          textColor: helperTextColor,
          text: hasHelper
              ? toBeginningOfSentenceCase(helperText)
              : kFastEmptyString,
        ),
      ),
    );
  }
}
