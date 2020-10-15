import 'package:flutter/material.dart';

class FastNotificationCenterOptions {
  final Widget leadingIcon;
  final double iconSize;
  final Color iconColor;

  FastNotificationCenterOptions({
    this.leadingIcon,
    this.iconSize,
    this.iconColor,
  });

  copyWith({
    Widget leadingIcon,
    double iconSize,
    Color iconColor,
  }) {
    return FastNotificationCenterOptions(
      leadingIcon: leadingIcon ?? this.leadingIcon,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}