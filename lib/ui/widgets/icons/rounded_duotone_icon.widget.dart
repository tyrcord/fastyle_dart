import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastRoundedDuotoneIcon extends FastRoundedIcon {
  final FastPaletteScheme? palette;

  const FastRoundedDuotoneIcon({
    super.key,
    required super.icon,
    super.backgroundColor,
    super.iconColor,
    super.iconSize,
    this.palette,
    super.shape,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.colors;
    var _backgroundColor = backgroundColor;
    var _iconColor = iconColor;
    var _icon = icon;

    if (palette != null) {
      _backgroundColor = palette!.lightest;
      _iconColor = palette!.mid;
    }

    _backgroundColor ??= colors.getPrimaryColor(context).withAlpha(155);

    return FastRoundedIcon(
      backgroundColor: _backgroundColor,
      iconColor: _iconColor,
      shape: shape,
      icon: _icon,
      size: size,
    );
  }
}
