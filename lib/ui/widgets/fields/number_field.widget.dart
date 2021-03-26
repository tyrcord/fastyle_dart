import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kSuffixIcon = SizedBox(width: 40, height: 33);
const _kSuffixIconConstraints = BoxConstraints(maxWidth: 40, maxHeight: 33);

class FastNumberField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final BoxConstraints? suffixIconConstraints;
  final Function(String)? onValueChanged;
  final bool transformInvalidNumber;
  final String? placeholderText;
  final bool allowAutocorrect;
  final String? initialValue;
  final TextAlign textAlign;
  final String? captionText;
  final Widget? suffixIcon;
  final bool acceptDecimal;
  final String? helperText;
  final String labelText;
  final bool isReadOnly;
  final bool isEnabled;
  final String? locale;
  final int maxLength;
  final int maxValue;

  FastNumberField({
    Key? key,
    required this.labelText,
    this.maxLength = NumberInputFormatter.safeIntegerMaxLength,
    this.maxValue = NumberInputFormatter.safeInteger,
    this.transformInvalidNumber = true,
    this.textAlign = TextAlign.start,
    this.allowAutocorrect = false,
    this.acceptDecimal = true,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.textEditingController,
    this.suffixIconConstraints,
    this.placeholderText,
    this.onValueChanged,
    this.initialValue,
    this.captionText,
    this.helperText,
    this.suffixIcon,
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
      textAlign: textAlign,
      textInputAction: TextInputAction.done,
      autocorrect: allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.numberWithOptions(
        decimal: acceptDecimal,
      ),
      decoration: InputDecoration(
        hintText: placeholderText,
        suffixIcon: suffixIcon != null ? _kSuffixIcon : null,
        suffixIconConstraints: _kSuffixIconConstraints,
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
