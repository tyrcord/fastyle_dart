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
    var backgroundColor0 = backgroundColor;
    var iconColor0 = iconColor;
    var icon0 = icon;

    if (palette != null && backgroundColor0 == null && iconColor0 == null) {
      backgroundColor0 = palette!.lightest;
      iconColor0 = palette!.mid;
    }

    backgroundColor0 ??= colors.getPrimaryColor(context).withAlpha(155);

    return FastRoundedIcon(
      backgroundColor: backgroundColor0,
      iconColor: iconColor0,
      shape: shape,
      icon: icon0,
      size: size,
    );
  }
}
