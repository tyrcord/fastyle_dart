import 'package:flutter/material.dart';

import 'package:tmodel_dart/tmodel_dart.dart';

class FastNotificationCenterOptions extends TModel {
  final Widget leadingIcon;
  final double iconSize;
  final Color iconColor;

  const FastNotificationCenterOptions({
    this.leadingIcon,
    this.iconSize,
    this.iconColor,
  });

  @override
  FastNotificationCenterOptions copyWith({
    Widget leadingIcon,
    double iconSize,
    Color iconColor,
  }) {
    return FastNotificationCenterOptions(
      leadingIcon: leadingIcon ?? this.leadingIcon,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  @override
  FastNotificationCenterOptions clone() {
    return FastNotificationCenterOptions(
      leadingIcon: leadingIcon,
      iconColor: iconColor,
      iconSize: iconSize,
    );
  }

  @override
  FastNotificationCenterOptions merge({
    @required FastNotificationCenterOptions options,
  }) {
    assert(options != null);

    return copyWith(
      leadingIcon: options.leadingIcon,
      iconColor: options.iconColor,
      iconSize: options.iconSize,
    );
  }

  @override
  List<Object> get props => [leadingIcon, iconSize, iconColor];
}
