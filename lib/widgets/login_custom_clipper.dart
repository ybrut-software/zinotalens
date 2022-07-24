import 'package:flutter/material.dart';

class LoginCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(size.width - 50, size.height - 50);
    var controlPoint2 = Offset(size.width / 1.5, size.height - 150);
    var controlPoint3 = Offset(50, size.height);
    var endPoint1 = Offset(size.width / 3, size.height - 50);
    var endPoint2 = Offset(0, size.height - 30);
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 150)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint1.dx, endPoint1.dy)
      ..quadraticBezierTo(
          controlPoint3.dx, controlPoint3.dy, endPoint2.dx, endPoint2.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
