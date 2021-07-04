import 'dart:ui';

import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FastPendingReadOnlyTextField extends StatefulWidget {
  final bool enableInteractiveSelection;
  final bool showHelperBoundaries;
  final String placeholderText;
  final Color? helperTextColor;
  final bool useFontForNumber;
  final Color? valueTextColor;
  final Color? highlightColor;
  final TextAlign textAlign;
  final String? captionText;
  final String? pendingText;
  final String? helperText;
  final String? valueText;
  final String labelText;
  final bool isPending;

  FastPendingReadOnlyTextField({
    Key? key,
    required this.labelText,
    this.placeholderText = kFastEmptyString,
    this.enableInteractiveSelection = true,
    this.showHelperBoundaries = true,
    this.textAlign = TextAlign.left,
    this.useFontForNumber = false,
    this.isPending = false,
    this.helperTextColor,
    this.highlightColor,
    this.valueTextColor,
    this.pendingText,
    this.captionText,
    this.helperText,
    this.valueText,
  }) : super(key: key);

  @override
  _FastPendingReadOnlyTextFieldState createState() =>
      _FastPendingReadOnlyTextFieldState();
}

class _FastPendingReadOnlyTextFieldState
    extends State<FastPendingReadOnlyTextField> {
  @override
  Widget build(BuildContext context) {
    return FastReadOnlyTextField(
      labelText: widget.labelText,
      captionText: widget.captionText,
      helperText: widget.helperText,
      helperTextColor: widget.helperTextColor,
      showHelperBoundaries: widget.showHelperBoundaries,
      child: _buidText(context),
    );
  }

  Widget _buidText(BuildContext context) {
    if (widget.isPending && widget.pendingText != null) {
      final baseColor = widget.valueTextColor ??
          ThemeHelper.texts.getBodyTextStyle(context).color!;
      final _highlightColor =
          widget.highlightColor ?? baseColor.withOpacity(0.1);

      return Shimmer.fromColors(
        highlightColor: _highlightColor,
        baseColor: baseColor,
        child: FastBody(
          textColor: baseColor,
          textAlign: widget.textAlign,
          fontWeight: FontWeight.w700,
          text: widget.pendingText!,
        ),
      );
    }

    return FastBody(
      enableInteractiveSelection: widget.enableInteractiveSelection,
      text: widget.valueText ?? widget.placeholderText,
      textColor: widget.valueTextColor,
      textAlign: widget.textAlign,
      fontWeight: FontWeight.w700,
    );
  }
}
