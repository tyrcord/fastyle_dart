// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fastyle_dart/fastyle_dart.dart';

/// A stateless widget that displays an empty container with the primary
/// background color of the current theme.
class FastEmptyContainer extends StatelessWidget {
  const FastEmptyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = ThemeHelper.colors;
    final backgroungColor = colors.getPrimaryBackgroundColor(context);

    return Container(color: backgroungColor);
  }
}
