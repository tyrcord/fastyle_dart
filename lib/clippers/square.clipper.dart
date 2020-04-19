import 'package:flutter/material.dart';

class FastSquareClipper extends CustomClipper<Path> {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  FastSquareClipper({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(topLeft, bottomLeft);
    path.lineTo(size.width, bottomRight);
    path.lineTo(size.width, topRight);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
