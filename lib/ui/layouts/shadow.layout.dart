import 'package:flutter/material.dart';

import 'package:fastyle_dart/fastyle_dart.dart';

class FastShadowLayout extends StatelessWidget {
  final Color? backgroundColor;
  final double borderRadius;
  final Color? shadowColor;
  final double blurRadius;
  final Widget child;

  FastShadowLayout({
    Key? key,
    required this.child,
    this.borderRadius = kFastBorderRadius,
    this.blurRadius = kFastBlurRadius,
    this.backgroundColor,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shadowColor =
        shadowColor ?? ThemeHelper.colors.getShadowColor(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: _shadowColor, blurRadius: blurRadius)],
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor ??
            ThemeHelper.colors.getBackGroundColor(
              context,
            ),
      ),
      child: child,
    );
  }
}
