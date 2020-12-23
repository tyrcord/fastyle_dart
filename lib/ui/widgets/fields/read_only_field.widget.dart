import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastReadOnlyTextField extends StatelessWidget {
  final String labelText;
  final String captionText;
  final String placeholderText;
  final String helperText;
  final TextAlign textAlign;
  final String valueText;
  final bool useFontForNumber;
  final Widget child;
  final bool enableInteractiveSelection;
  final Color valueTextColor;
  final bool showHelperBoundaries;
  final Color helperTextColor;

  FastReadOnlyTextField({
    Key key,
    @required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.valueText,
    this.textAlign,
    bool useFontForNumber = false,
    this.child,
    bool enableInteractiveSelection = true,
    bool showHelperBoundaries = true,
    this.valueTextColor,
    this.helperTextColor,
  })  : assert(labelText != null),
        enableInteractiveSelection = enableInteractiveSelection ?? true,
        useFontForNumber = useFontForNumber ?? false,
        showHelperBoundaries = showHelperBoundaries ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      labelText: labelText,
      captionText: captionText,
      helperText: helperText,
      helperTextColor: helperTextColor,
      control: _buildControl(context),
      showHelperBoundaries: showHelperBoundaries,
    );
  }

  Widget _buildControl(BuildContext context) {
    return Container(
      height: 37.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: child ??
            FastBody(
              text: valueText ?? placeholderText,
              enableInteractiveSelection: enableInteractiveSelection,
              textAlign: textAlign,
              fontWeight: FontWeight.w700,
              textColor: valueText != null ? valueTextColor : null,
            ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(
            context,
            color: Theme.of(context)
                .inputDecorationTheme
                .enabledBorder
                .borderSide
                .color,
            width: kFastBorderSize,
          ),
        ),
      ),
    );
  }
}
