import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastWelcomePage extends StatelessWidget {
  final String titleText;
  final List<Widget>? children;

  const FastWelcomePage({
    Key? key,
    required this.titleText,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO improvements
    // https://github.com/flutter/flutter/issues/18711#issuecomment-505791677
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            kFastSizedBox16,
            FastHeadline(text: titleText),
            if (children != null) ...children!,
            kFastSizedBox16,
          ],
        ),
      ),
    );
  }
}
