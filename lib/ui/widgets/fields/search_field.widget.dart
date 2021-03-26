import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastSearchField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onValueChanged;
  final String placeholderText;
  final bool allowAutocorrect;
  final TextAlign textAlign;
  final EdgeInsets margin;
  final bool isReadOnly;

  FastSearchField({
    Key? key,
    this.placeholderText = kFastSearchPlaceholderText,
    this.margin = const EdgeInsets.only(bottom: 8.0),
    this.textAlign = TextAlign.start,
    this.allowAutocorrect = false,
    this.isReadOnly = false,
    this.textEditingController,
    this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      margin: margin,
      control: _buildControl(context),
      showHelperBoundaries: false,
    );
  }

  Widget _buildControl(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: isReadOnly,
      textAlign: textAlign,
      textInputAction: TextInputAction.search,
      autocorrect: allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: placeholderText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      style: ThemeHelper.texts.getTitleTextStyle(context),
      onChanged: onValueChanged,
    );
  }
}
