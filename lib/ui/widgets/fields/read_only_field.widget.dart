import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastReadOnlyTextField extends StatelessWidget {
  final bool enableInteractiveSelection;
  final bool showHelperBoundaries;
  final Color? helperTextColor;
  final String placeholderText;

  final Color? valueTextColor;
  final String? captionText;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final String? helperText;
  final String? valueText;
  final String labelText;
  final Widget? child;

  const FastReadOnlyTextField({
    Key? key,
    required this.labelText,
    this.placeholderText = kFastEmptyString,
    this.enableInteractiveSelection = true,
    this.showHelperBoundaries = true,
    this.textAlign = TextAlign.left,
    this.helperTextColor,
    this.valueTextColor,
    this.captionText,
    this.suffixIcon,
    this.helperText,
    this.valueText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      labelText: labelText,
      captionText: captionText,
      helperText: helperText,
      helperTextColor: helperTextColor,
      control: _buildControl(context),
      showHelperBoundaries: showHelperBoundaries,
      suffixIcon: suffixIcon,
    );
  }

  Widget _buildControl(BuildContext context) {
    return Container(
      height: 37.0,
      decoration: ThemeHelper.createBorderSide(context),
      child: Align(
        alignment: Alignment.centerLeft,
        child: child ??
            FastBody(
              text: valueText ?? placeholderText,
              enableInteractiveSelection: enableInteractiveSelection,
              textAlign: textAlign,
              fontWeight: kFastFontWeightBold,
              textColor: valueText != null ? valueTextColor : null,
            ),
      ),
    );
  }
}
