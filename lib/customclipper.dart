import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 150);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 150);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
