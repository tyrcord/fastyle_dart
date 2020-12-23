import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

const _kMargin = EdgeInsets.symmetric(vertical: 8.0);

class FastParagraph extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final Widget child;

  const FastParagraph({
    Key key,
    this.text,
    this.margin,
    this.child,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? _kMargin,
      child: child ?? FastBody(text: text),
    );
  }
}
