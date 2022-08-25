import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastTextField extends StatefulWidget implements IFastInput {
  final TextEditingController? textEditingController;
  final bool showHelperBoundaries;
  final String? placeholderText;
  final bool allowAutocorrect;

  final String? initialValue;
  final String? captionText;
  final TextAlign textAlign;
  final String? helperText;
  final String labelText;
  final bool isReadOnly;

  @override
  final ValueChanged<String>? onValueChanged;

  @override
  final Duration debounceTimeDuration;

  @override
  final bool shouldDebounceTime;

  @override
  final bool isEnabled;

  FastTextField({
    Key? key,
    required this.labelText,
    this.debounceTimeDuration = kFastDebounceTimeDuration,
    this.textAlign = TextAlign.start,
    this.showHelperBoundaries = true,
    this.shouldDebounceTime = false,
    this.allowAutocorrect = false,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.textEditingController,
    this.placeholderText,
    this.onValueChanged,
    this.initialValue,
    this.captionText,
    this.helperText,
  }) : super(key: key);

  @override
  _FastTextFieldState createState() => _FastTextFieldState();
}

class _FastTextFieldState extends State<FastTextField>
    with FastDebounceInputMixin {
  @override
  void dispose() {
    super.dispose();
    unsubscribeToDebouncerEventsIfNeeded();
    debouncer.close();
  }

  @override
  Widget build(BuildContext context) {
    return FastFieldLayout(
      showHelperBoundaries: widget.showHelperBoundaries,
      control: _buildControl(context),
      captionText: widget.captionText,
      helperText: widget.helperText,
      labelText: widget.labelText,
    );
  }

  Widget _buildControl(BuildContext context) {
    return TextFormField(
      readOnly: widget.isReadOnly,
      enabled: !widget.isReadOnly,
      initialValue: widget.initialValue,
      textAlign: widget.textAlign,
      textInputAction: TextInputAction.done,
      autocorrect: widget.allowAutocorrect,
      cursorColor: ThemeHelper.colors.getPrimaryColor(context),
      keyboardType: TextInputType.text,
      style: ThemeHelper.texts.getBodyTextStyle(context).copyWith(
            fontWeight: kFastFontWeightBold,
          ),
      decoration: InputDecoration(hintText: widget.placeholderText),
      onChanged: debounceOnValueChangedIfNeeded(),
    );
  }
}
