import 'package:flutter/material.dart';

class FastSquareClipper extends CustomClipper<Path> {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  FastSquareClipper({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  })  : topLeft = topLeft ?? 0.0,
        topRight = topRight ?? 0.0,
        bottomLeft = bottomLeft ?? 0.0,
        bottomRight = bottomRight ?? 0.0;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(topLeft, bottomLeft);
    path.lineTo(size.width, bottomRight);
    path.lineTo(size.width, topRight);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
