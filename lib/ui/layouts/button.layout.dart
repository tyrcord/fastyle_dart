import 'package:flutter/material.dart';

class FastButtonLayout extends StatelessWidget {
  final Widget child;

  const FastButtonLayout({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40.0, minWidth: 44.0),
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: child,
    );
  }
}
