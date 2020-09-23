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
  final bool allowAutocorrect;
  final String initialValue;
  final Function(String) onValueChanged;

  FastNumberField({
    Key key,
    @required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    int maxLength = NumberInputFormatter.safeMaxLength,
    int maxValue = NumberInputFormatter.safeInteger,
    bool isReadOnly = false,
    bool shouldAcceptDecimalValue = true,
    bool allowAutocorrect = false,
    this.textAlign,
    this.initialValue,
    this.onValueChanged,
  })  : assert(labelText != null),
        this.maxLength = maxLength ?? NumberInputFormatter.safeMaxLength,
        this.maxValue = maxValue ?? NumberInputFormatter.safeInteger,
        this.isReadOnly = isReadOnly ?? false,
        this.shouldAcceptDecimalValue = shouldAcceptDecimalValue ?? true,
        this.allowAutocorrect = allowAutocorrect ?? false,
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
    final bodyTextStyle = ThemeHelper.texts.getBodyTextStyle(context);

    return TextFormField(
      initialValue: initialValue,
      readOnly: isReadOnly,
      enabled: !isReadOnly,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.done,
      autocorrect: allowAutocorrect,
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
      onChanged: onValueChanged,
    );
  }
}
