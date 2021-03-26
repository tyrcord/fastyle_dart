import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onValueChanged;
  final String? placeholderText;
  final bool allowAutocorrect;
  final bool useFontForNumber;
  final String? initialValue;
  final String? captionText;
  final TextAlign textAlign;
  final String? helperText;
  final String labelText;
  final bool isReadOnly;

  FastTextField({
    Key? key,
    required this.labelText,
    this.textAlign = TextAlign.start,
    this.allowAutocorrect = false,
    this.useFontForNumber = false,
    this.isReadOnly = false,
    this.textEditingController,
    this.placeholderText,
    this.onValueChanged,
    this.initialValue,
    this.captionText,
    this.helperText,
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
    return TextFormField(
      readOnly: isReadOnly,
      enabled: !isReadOnly,
      initialValue: initialValue,
      textAlign: textAlign,
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
