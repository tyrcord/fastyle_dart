import 'package:flutter/material.dart';

const _kMinButtonHeight = 40.0;
const _kMinButtonWidth = 44.0;

class FastButtonLayout extends StatelessWidget {
  final Widget child;

  const FastButtonLayout({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: _kMinButtonHeight,
        minWidth: _kMinButtonWidth,
      ),
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: child,
    );
  }
}
