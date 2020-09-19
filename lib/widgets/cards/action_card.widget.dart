import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastActionCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final String titleText;
  final List<Widget> headerActions;
  final List<Widget> footerActions;
  final Color shadowColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  FastActionCard({
    Key key,
    @required this.onTap,
    @required this.titleText,
    this.child,
    this.padding,
    this.headerActions,
    this.footerActions,
    this.shadowColor,
    this.backgroundColor,
  })  : assert(onTap != null),
        assert(titleText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FastCard(
        titleText: titleText,
        child: child,
        padding: padding,
        headerActions: headerActions,
        footerActions: footerActions,
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
