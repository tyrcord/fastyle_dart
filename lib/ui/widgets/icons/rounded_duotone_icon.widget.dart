import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastRoundedDuotoneIcon extends FastRoundedIcon {
  const FastRoundedDuotoneIcon({
    super.key,
    required super.icon,
    super.backgroundColor,
    super.shape,
    super.size,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.colors;
    final _backgroundColor =
        backgroundColor ?? colors.getPrimaryColor(context).withAlpha(155);

    return FastRoundedIcon(
      backgroundColor: _backgroundColor,
      shape: shape,
      icon: icon,
      size: size,
    );
  }
}
