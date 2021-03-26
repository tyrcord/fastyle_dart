import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastRoundedIcon extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor;
  final double iconSize;
  final Color? backgroundColor;

  const FastRoundedIcon({
    Key? key,
    required this.iconData,
    this.iconSize = kFastIconSizeSmall,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kFastEdgeInsets6,
      decoration: BoxDecoration(
        color: backgroundColor ?? ThemeHelper.colors.getPrimaryColor(context),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: iconSize,
        color: iconColor ?? ThemeHelper.colors.getWhiteColor(context),
      ),
    );
  }
}
