import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const FastPadding({
    Key key,
    @required this.child,
    @required this.padding,
  })  : assert(child != null),
        assert(padding != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

class FastPadding24 extends FastPadding {
  FastPadding24({
    Key key,
    Widget child,
    EdgeInsets padding = kFastEdgeInsets24,
  }) : super(
          key: key,
          child: child,
          padding: padding ?? kFastEdgeInsets24,
        );
}

class FastPadding16 extends FastPadding {
  FastPadding16({
    Key key,
    Widget child,
    EdgeInsets padding = kFastEdgeInsets16,
  }) : super(
          key: key,
          child: child,
          padding: padding ?? kFastEdgeInsets16,
        );
}

class FastPadding12 extends FastPadding {
  FastPadding12({
    Key key,
    Widget child,
    EdgeInsets padding = kFastEdgeInsets12,
  }) : super(
          key: key,
          child: child,
          padding: padding ?? kFastEdgeInsets12,
        );
}

class FastPadding8 extends FastPadding {
  FastPadding8({
    Key key,
    Widget child,
    EdgeInsets padding = kFastEdgeInsets8,
  }) : super(
          key: key,
          child: child,
          padding: padding ?? kFastEdgeInsets8,
        );
}
