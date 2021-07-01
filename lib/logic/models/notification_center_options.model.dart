import 'package:flutter/material.dart';

import 'package:tmodel_dart/tmodel_dart.dart';

class FastNotificationCenterOptions extends TModel {
  ///
  /// A widget to display before the notification title.
  ///
  final Widget? leadingIcon;

  ///
  /// Represents the color to use when drawing an icon.
  ///
  final Color? iconColor;

  ///
  /// Represents the size of the icon in logical pixels.
  ///
  final double? iconSize;

  const FastNotificationCenterOptions({
    this.leadingIcon,
    this.iconColor,
    this.iconSize,
  });

  @override
  FastNotificationCenterOptions copyWith({
    Widget? leadingIcon,
    Color? iconColor,
    double? iconSize,
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
  FastNotificationCenterOptions merge(
    covariant FastNotificationCenterOptions options,
  ) {
    return copyWith(
      leadingIcon: options.leadingIcon,
      iconColor: options.iconColor,
      iconSize: options.iconSize,
    );
  }

  @override
  List<Object?> get props => [leadingIcon, iconColor, iconSize];
}
