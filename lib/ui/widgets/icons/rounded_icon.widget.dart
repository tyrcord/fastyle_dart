import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FastRoundedIcon extends StatelessWidget {
  final Color? backgroundColor;
  final FastBoxShape? shape;
  final Color? iconColor;
  final double? iconSize;
  final double ratio;
  final Widget icon;
  final double size;

  const FastRoundedIcon({
    super.key,
    required this.icon,
    this.size = kFastIconSizeMedium,
    this.ratio = 0.55,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final hasRadius = shape == FastBoxShape.roundedRectangle;
    final radius = hasRadius ? BorderRadius.circular(8) : null;
    final _shape = _getShape();
    var _icon = icon;

    if (icon is Icon) {
      _icon = _transformIcon(icon as Icon);
    } else if (icon is FaIcon) {
      _icon = _transformFaIcon(icon as FaIcon);
    }

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context),
        borderRadius: radius,
        shape: _shape,
      ),
      child: Center(child: _icon),
    );
  }

  BoxShape _getShape() {
    switch (shape) {
      case FastBoxShape.roundedRectangle:
        return BoxShape.rectangle;
      case FastBoxShape.rectangle:
        return BoxShape.rectangle;
      default:
        return BoxShape.circle;
    }
  }

  Icon _transformIcon(Icon icon) {
    return Icon(
      icon.icon,
      color: iconColor ?? icon.color,
      size: iconSize ?? size * ratio,
    );
  }

  FaIcon _transformFaIcon(FaIcon icon) {
    return FaIcon(
      icon.icon,
      color: iconColor ?? icon.color,
      size: iconSize ?? size * ratio,
    );
  }
}
