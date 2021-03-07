import 'package:flutter/material.dart';

abstract class IFastButton extends StatefulWidget {
  final Duration? trottleTimeDuration;
  final bool? shouldTrottleTime;
  final VoidCallback onTap;
  final bool? isEnabled;

  IFastButton({
    required this.onTap,
    this.trottleTimeDuration,
    this.shouldTrottleTime,
    this.isEnabled,
  });
}
