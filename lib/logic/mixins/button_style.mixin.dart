// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

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
    double? fontSize,
  }) {
    return FastButtonLabel(
      text: widget.text ?? kFastButtonLabel,
      textColor: widget.isEnabled
          ? textColor
          : disabledTextColor ?? textColor.withAlpha(kDisabledAlpha),
      upperCase: upperCase,
      fontSize: fontSize,
    );
  }
}
