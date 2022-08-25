import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FastPendingReadOnlyTextField extends StatelessWidget {
  final bool enableInteractiveSelection;
  final bool showHelperBoundaries;
  final String placeholderText;
  final Color? helperTextColor;

  final Color? valueTextColor;
  final Color? highlightColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String? captionText;
  final String? pendingText;
  final Widget? suffixIcon;
  final String? helperText;
  final String? valueText;
  final String labelText;
  final bool isPending;

  FastPendingReadOnlyTextField({
    Key? key,
    required this.labelText,
    this.placeholderText = kFastEmptyString,
    this.enableInteractiveSelection = true,
    this.fontWeight = kFastFontWeightBold,
    this.showHelperBoundaries = true,
    this.textAlign = TextAlign.left,
    this.isPending = false,
    this.helperTextColor,
    this.highlightColor,
    this.valueTextColor,
    this.pendingText,
    this.captionText,
    this.suffixIcon,
    this.helperText,
    this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastReadOnlyTextField(
      labelText: labelText,
      captionText: captionText,
      helperText: helperText,
      helperTextColor: helperTextColor,
      showHelperBoundaries: showHelperBoundaries,
      suffixIcon: suffixIcon,
      child: _buidText(context),
    );
  }

  Widget _buidText(BuildContext context) {
    if (isPending && pendingText != null) {
      final baseColor =
          valueTextColor ?? ThemeHelper.texts.getBodyTextStyle(context).color!;
      final _highlightColor = highlightColor ?? baseColor.withOpacity(0.1);

      return Shimmer.fromColors(
        highlightColor: _highlightColor,
        baseColor: baseColor,
        child: FastBody(
          textColor: baseColor,
          textAlign: textAlign,
          fontWeight: fontWeight,
          text: pendingText!,
        ),
      );
    }

    return FastBody(
      enableInteractiveSelection: enableInteractiveSelection,
      text: valueText ?? placeholderText,
      textColor: valueTextColor,
      textAlign: textAlign,
      fontWeight: fontWeight,
    );
  }
}
