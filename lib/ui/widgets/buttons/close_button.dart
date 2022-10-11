import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastCloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const FastCloseButton({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return FastIconButton(
      icon: const Icon(Icons.close),
      iconColor: color,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
