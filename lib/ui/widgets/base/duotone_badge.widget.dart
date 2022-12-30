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
    var _backgroundColor = backgroundColor;
    var _textColor = textColor;

    if (palette != null && _backgroundColor == null && _textColor == null) {
      _backgroundColor = palette!.ultraLight;
      _textColor = palette!.dark;
    }

    return FastBadge(
      backgroundColor: _backgroundColor,
      borderRadius: borderRadius,
      textColor: _textColor,
      padding: padding,
      text: text,
    );
  }
}
