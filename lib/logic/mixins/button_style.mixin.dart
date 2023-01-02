import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

mixin FastButtonSyleMixin<T extends FastButton> on State<T> {
  MaterialStateProperty<OutlinedBorder> getButtonShape() {
    return MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  MaterialStateProperty<EdgeInsetsGeometry?> getButtonPadding() {
    return MaterialStateProperty.all<EdgeInsetsGeometry?>(widget.padding);
  }

  MaterialStateProperty<Color> getOverlayColor(Color textColor) {
    return MaterialStateProperty.all<Color>(
      widget.highlightColor ?? textColor.withOpacity(0.1),
    );
  }

  FastButtonLabel buildButtonLabel(
    Color textColor, {
    Color? disabledTextColor,
    bool upperCase = true,
  }) {
    return FastButtonLabel(
      text: widget.text ?? kFastButtonLabel,
      textColor: widget.isEnabled
          ? textColor
          : disabledTextColor ?? textColor.withAlpha(kDisabledAlpha),
      upperCase: upperCase,
    );
  }
}
