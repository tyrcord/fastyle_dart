import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastDivider extends StatelessWidget {
  final double height;
  final Color? color;

  const FastDivider({
    Key? key,
    this.height = kFastBorderSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: ThemeHelper.createBorderSide(context, color: color),
      child: SizedBox(height: height, width: double.infinity),
    );
  }
}
