import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lasttCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lasttCurve.dx, lasttCurve.dy);

    final seconedFirstCurve = Offset(0, size.height - 20);
    final seconedLasttCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(seconedFirstCurve.dx, seconedFirstCurve.dy,
        seconedLasttCurve.dx, seconedLasttCurve.dy);

    final thiedFirstCurve = Offset(size.width, size.height - 20);
    final thirddLasttCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thiedFirstCurve.dx, thiedFirstCurve.dy,
        thirddLasttCurve.dx, thirddLasttCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
