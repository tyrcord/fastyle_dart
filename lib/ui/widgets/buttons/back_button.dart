import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FastBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const FastBackButton({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return FastIconButton(
      icon: const BackButtonIcon(),
      iconColor: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          if (context.canPop()) {
            context.pop();
          }
        }
      },
    );
  }
}
