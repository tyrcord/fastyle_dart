import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNumberField extends StatelessWidget {
  final String labelText;
  final String captionText;
  final String placeholderText;
  final String helperText;
  final bool isReadOnly;
  final bool shouldAcceptDecimalValue;
  final int maxLength;
  final int maxValue;
  final TextAlign textAlign;

  FastNumberField({
    Key key,
    @required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.maxLength = NumberInputFormatter.safeMaxLength,
    this.maxValue = NumberInputFormatter.safeInteger,
    this.isReadOnly = false,
    this.shouldAcceptDecimalValue = true,
    this.textAlign,
  }) : super(key: key);

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
    final bodyTextStyle = ThemeHelper.texts.getBodyTextStyle(context);

    return TextFormField(
      readOnly: isReadOnly,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.done,
      autocorrect: false,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.numberWithOptions(
        decimal: shouldAcceptDecimalValue,
      ),
      decoration: InputDecoration(hintText: placeholderText),
      style: bodyTextStyle.copyWith(fontFamily: kFastFontForNumber),
      inputFormatters: [
        NumberInputFormatter(
          maxLength: maxLength,
          maxValue: maxValue,
          shouldAcceptDecimalValue: shouldAcceptDecimalValue,
        ),
      ],
    );
  }
}
