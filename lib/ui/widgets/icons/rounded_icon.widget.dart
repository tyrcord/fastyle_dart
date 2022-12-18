import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

enum FastBoxShape {
  roundedRectangle,
  rectangle,
  circle,
}

class FastRoundedIcon extends StatelessWidget {
  final Color? backgroundColor;
  final FastBoxShape? shape;
  final Widget icon;
  final double size;

  const FastRoundedIcon({
    super.key,
    required this.icon,
    this.size = kFastIconSizeSmall,
    this.backgroundColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final hasRadius = shape == FastBoxShape.roundedRectangle;
    final radius = hasRadius ? BorderRadius.circular(8) : null;
    final _shape = _getShape();

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context),
        borderRadius: radius,
        shape: _shape,
      ),
      child: Center(child: icon),
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
}
