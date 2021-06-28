import 'package:flutter/material.dart';

abstract class IFastInput extends StatefulWidget {
  final ValueChanged<String>? onValueChanged;
  final Duration debounceTimeDuration;
  final bool shouldDebounceTime;
  final bool isEnabled;

  IFastInput({
    required this.debounceTimeDuration,
    this.shouldDebounceTime = false,
    this.isEnabled = true,
    this.onValueChanged,
  });
}
