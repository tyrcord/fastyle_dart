import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kTitleMargin = EdgeInsets.symmetric(vertical: 16.0);

class FastArticle extends StatelessWidget {
  final String titleText;
  final EdgeInsets titleMargin;
  final Iterable<Widget> children;

  const FastArticle({
    Key key,
    @required this.titleText,
    this.titleMargin,
    this.children,
  })  : assert(titleText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: titleMargin ?? _kTitleMargin,
          child: FastTitle(text: titleText),
        ),
        if (children != null) ...children,
      ],
    );
  }
}
