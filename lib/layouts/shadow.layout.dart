import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

const _kBorderRadius = 4.0;
const _kBlurRadius = 1.0;

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
    final _blurRadius = blurRadius ?? _kBlurRadius;
    final _borderRadius = borderRadius ?? _kBorderRadius;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? ThemeHelper.colors.getShadowColor(context),
            blurRadius: _blurRadius,
          ),
        ],
        borderRadius: BorderRadius.circular(_borderRadius),
        color: backgroundColor ?? Theme.of(context).backgroundColor,
      ),
      child: child,
    );
  }
}
