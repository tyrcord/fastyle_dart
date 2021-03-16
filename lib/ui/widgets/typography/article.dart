import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kTitleMargin = EdgeInsets.symmetric(vertical: 16.0);

class FastArticle extends StatelessWidget {
  final String titleText;
  final EdgeInsets titleMargin;
  final Iterable<Widget>? children;

  const FastArticle({
    Key? key,
    required this.titleText,
    this.titleMargin = _kTitleMargin,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: titleMargin,
          child: FastTitle(text: titleText, fontWeight: FontWeight.w700),
        ),
        if (children != null) ...children!,
      ],
    );
  }
}
