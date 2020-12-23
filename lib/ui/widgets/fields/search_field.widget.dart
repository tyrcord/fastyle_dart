import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kSearchPlaceholderText = 'Search...';

class FastSearchField extends StatelessWidget {
  final String placeholderText;
  final bool isReadOnly;
  final ValueChanged<String> onValueChanged;
  final TextEditingController textEditingController;
  final EdgeInsets margin;
  final TextAlign textAlign;
  final bool allowAutocorrect;

  FastSearchField({
    Key key,
    this.placeholderText,
    this.onValueChanged,
    this.textEditingController,
    bool isReadOnly = false,
    this.margin,
    this.textAlign,
    bool allowAutocorrect = false,
  })  : isReadOnly = isReadOnly ?? false,
        allowAutocorrect = allowAutocorrect ?? false,
        super(key: key);

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
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.search,
      autocorrect: allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: placeholderText ?? _kSearchPlaceholderText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      style: ThemeHelper.texts.getTitleTextStyle(context),
      onChanged: onValueChanged,
    );
  }
}
