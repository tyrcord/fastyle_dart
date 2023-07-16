// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

class FastCloseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const FastCloseButton({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return FastIconButton(
      icon: kFastCloseIcon,
      iconColor: color,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
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
