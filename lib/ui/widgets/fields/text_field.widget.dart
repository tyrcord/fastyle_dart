import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTextField extends StatelessWidget {
  final String labelText;
  final String captionText;
  final String placeholderText;
  final String helperText;
  final bool isReadOnly;
  final ValueChanged<String> onValueChanged;
  final TextAlign textAlign;
  final TextEditingController textEditingController;
  final bool allowAutocorrect;
  final String initialValue;
  final bool useFontForNumber;

  FastTextField({
    Key key,
    @required this.labelText,
    this.initialValue,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.onValueChanged,
    this.textAlign,
    this.textEditingController,
    bool isReadOnly = false,
    bool allowAutocorrect = false,
    bool useFontForNumber = false,
  })  : assert(labelText != null),
        isReadOnly = isReadOnly ?? false,
        allowAutocorrect = allowAutocorrect ?? false,
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
    return TextFormField(
      readOnly: isReadOnly,
      enabled: !isReadOnly,
      initialValue: initialValue,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.done,
      autocorrect: allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.text,
      style: ThemeHelper.texts.getBodyTextStyle(context).copyWith(
            fontWeight: FontWeight.w700,
            fontFamily: useFontForNumber ? kFastFontForNumber : null,
          ),
      decoration: InputDecoration(hintText: placeholderText),
      onChanged: onValueChanged,
      controller: textEditingController,
    );
  }
}
