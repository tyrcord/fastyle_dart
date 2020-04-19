import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastPadding24 extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  FastPadding24({
    Key key,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kFastEdgeInsets24,
      child: child,
    );
  }
}

class FastPadding16 extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  FastPadding16({
    Key key,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kFastEdgeInsets16,
      child: child,
    );
  }
}

class FastPadding12 extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  FastPadding12({
    Key key,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kFastEdgeInsets12,
      child: child,
    );
  }
}

class FastPadding8 extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  FastPadding8({
    Key key,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kFastEdgeInsets8,
      child: child,
    );
  }
}
