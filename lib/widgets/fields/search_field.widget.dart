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

  FastSearchField({
    Key key,
    this.placeholderText,
    this.onValueChanged,
    this.textEditingController,
    this.isReadOnly = false,
    this.margin,
    this.textAlign,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return FastFieldLayout(
      margin: margin,
      control: _buildControl(context),
      showHelperBoundaries: false,
    );
  }

  Widget _buildControl(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: textEditingController,
      readOnly: isReadOnly,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.search,
      autocorrect: false,
      cursorColor: theme.primaryColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: placeholderText ?? _kSearchPlaceholderText,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      style: theme.textTheme.title,
      onChanged: onValueChanged,
    );
  }
}
