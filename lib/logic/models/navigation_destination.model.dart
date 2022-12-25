import 'package:fastyle_dart/constants/edge_insets.constants.dart';
import 'package:flutter/material.dart';

class FastNavigationDestination {
  final Widget? selectedIcon;
  final String? tooltip;
  final String label;
  final Widget icon;
  final Key? key;

  const FastNavigationDestination({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.tooltip,
    this.key,
  });

  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      selectedIcon: selectedIcon,
      tooltip: tooltip,
      label: label,
      icon: icon,
      key: key,
    );
  }

  NavigationRailDestination toNavigationRailDestination() {
    return NavigationRailDestination(
      label: Text(label),
      selectedIcon: selectedIcon,
      padding: kFastEdgeInsets12,
      icon: icon,
    );
  }
}
