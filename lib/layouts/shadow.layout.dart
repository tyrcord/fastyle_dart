import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kBlurRadius = 1.0;
const _kBorderRadius = 4.0;

class FastShadowLayout extends StatelessWidget {
  final Color shadowColor;
  final Color backgroundColor;
  final Widget child;
  final double blurRadius;
  final double borderRadius;

  FastShadowLayout({
    Key key,
    @required this.child,
    @required this.shadowColor,
    this.backgroundColor,
    this.blurRadius,
    this.borderRadius,
  }) : super(key: key);

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
