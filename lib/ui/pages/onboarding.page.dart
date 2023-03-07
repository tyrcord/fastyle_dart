import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastOnboardingPage extends StatelessWidget {
  final String titleText;
  final List<Widget>? children;

  const FastOnboardingPage({
    Key? key,
    required this.titleText,
    this.children,
  }) : super(key: key);

  // TODO improvements
  // https://github.com/flutter/flutter/issues/18711#issuecomment-505791677
  @override
  Widget build(BuildContext context) {
    final spacing = ThemeHelper.spacing.getVerticalSpacing(context);
    final padding = ThemeHelper.spacing.getHorizontalPadding(context);

    return Container(
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            spacing,
            FastHeadline(text: titleText),
            if (children != null) ...children!,
          ],
        ),
      ),
    );
  }
}
