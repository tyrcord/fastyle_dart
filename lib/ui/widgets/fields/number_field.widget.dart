import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastNumberField extends StatelessWidget {
  final String labelText;
  final String? captionText;
  final String? placeholderText;
  final String? helperText;
  final bool isReadOnly;
  final bool acceptDecimal;
  final int maxLength;
  final int maxValue;
  final TextAlign? textAlign;
  final bool allowAutocorrect;
  final String? initialValue;
  final Function(String)? onValueChanged;
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool transformInvalidNumber;
  final String? locale;

  FastNumberField({
    Key? key,
    required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.maxLength = NumberInputFormatter.safeIntegerMaxLength,
    this.maxValue = NumberInputFormatter.safeInteger,
    this.transformInvalidNumber = true,
    this.isReadOnly = false,
    this.acceptDecimal = true,
    this.allowAutocorrect = false,
    this.textAlign,
    this.initialValue,
    this.onValueChanged,
    this.textEditingController,
    this.isEnabled = true,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.locale,
  })  : assert(initialValue == null || textEditingController == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      labelText: labelText,
      captionText: captionText,
      helperText: helperText,
      control: _buildControl(context),
      suffixIcon: suffixIcon,
    );
  }

  Widget _buildControl(BuildContext context) {
    final bodyTextStyle = ThemeHelper.texts.getBodyTextStyle(context);

    return TextFormField(
      initialValue: initialValue,
      readOnly: isReadOnly,
      enabled: isEnabled,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.done,
      autocorrect: allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.numberWithOptions(
        decimal: acceptDecimal,
      ),
      decoration: InputDecoration(
        hintText: placeholderText,
        suffixIcon:
            suffixIcon != null ? const SizedBox(width: 40, height: 33) : null,
        suffixIconConstraints:
            const BoxConstraints(maxWidth: 40, maxHeight: 33),
      ),
      style: bodyTextStyle.copyWith(
        fontFamily: kFastFontForNumber,
        fontWeight: FontWeight.w700,
      ),
      inputFormatters: [
        NumberInputFormatter(
          maxLength: maxLength,
          maxValue: maxValue,
          allowDecimals: acceptDecimal,
          transformInvalidNumber: transformInvalidNumber,
        ),
      ],
      onChanged: onValueChanged,
      controller: textEditingController,
    );
  }
}
