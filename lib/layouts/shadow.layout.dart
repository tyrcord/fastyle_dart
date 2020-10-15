import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastShadowLayout extends StatelessWidget {
  final Color backgroundColor;
  final double borderRadius;
  final Color shadowColor;
  final double blurRadius;
  final Widget child;

  FastShadowLayout({
    Key key,
    @required this.child,
    this.shadowColor,
    this.backgroundColor,
    this.borderRadius,
    this.blurRadius,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _blurRadius = blurRadius ?? kFastBlurRadius;
    final _borderRadius = borderRadius ?? kFastBorderRadius;
    final _shadowColor =
        shadowColor ?? ThemeHelper.colors.getShadowColor(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: _shadowColor, blurRadius: _blurRadius),
        ],
        borderRadius: BorderRadius.circular(_borderRadius),
        color: backgroundColor ?? Theme.of(context).backgroundColor,
      ),
      child: child,
    );
  }
}
