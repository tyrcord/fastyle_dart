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
  })  : assert(labelText != null),
        enableInteractiveSelection = enableInteractiveSelection ?? true,
        useFontForNumber = useFontForNumber ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      labelText: labelText,
      captionText: captionText,
      helperText: helperText,
      control: _buildControl(context),
    );
  }

  Widget _buildControl(BuildContext context) {
    return Container(
      height: 37.0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: child ??
            SelectableText(
              valueText ?? placeholderText,
              enableInteractiveSelection: enableInteractiveSelection,
              textAlign: textAlign,
              style: ThemeHelper.texts.getBodyTextStyle(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: useFontForNumber ? kFastFontForNumber : null,
                  ),
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
