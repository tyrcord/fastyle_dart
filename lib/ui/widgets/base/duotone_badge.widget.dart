import 'package:fastyle_dart/ui/ui.dart';
import 'package:flutter/material.dart';

/// A duotone badge widget that can be used to display a small amount of
/// information.
class FastDuotoneBadge extends FastBadge {
  /// The palette.
  final FastPaletteScheme? palette;

  const FastDuotoneBadge({
    super.key,
    super.backgroundColor,
    super.borderRadius,
    super.textColor,
    super.padding,
    this.palette,
    super.text,
  });

  @override
  Widget build(BuildContext context) {
    var backgroundColor0 = backgroundColor;
    var textColor0 = textColor;

    if (palette != null && backgroundColor0 == null && textColor0 == null) {
      backgroundColor0 = palette!.ultraLight;
      textColor0 = palette!.dark;
    }

    return FastBadge(
      backgroundColor: backgroundColor0,
      borderRadius: borderRadius,
      textColor: textColor0,
      padding: padding,
      text: text,
    );
  }
}
