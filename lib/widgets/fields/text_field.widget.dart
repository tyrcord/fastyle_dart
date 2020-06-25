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

  FastTextField({
    Key key,
    @required this.labelText,
    this.captionText,
    this.placeholderText,
    this.helperText,
    this.isReadOnly = false,
    this.onValueChanged,
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
    final theme = Theme.of(context);

    return TextFormField(
      readOnly: isReadOnly,
      textAlign: textAlign ?? TextAlign.start,
      textInputAction: TextInputAction.done,
      autocorrect: false,
      cursorColor: theme.primaryColor,
      keyboardType: TextInputType.text,
      style: ThemeHelper.texts.getBodyTextStyle(context),
      decoration: InputDecoration(hintText: placeholderText),
      onChanged: onValueChanged,
    );
  }
}
