import 'package:flutter/cupertino.dart';

class BGCurvedEdges extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    //First curve
    final startCurveInitial = Offset(0, size.height - 30);
    final startCurveEnd = Offset(30, size.height - 30);
    path.quadraticBezierTo(
        startCurveInitial.dx, startCurveInitial.dy, startCurveEnd.dx, startCurveEnd.dy);


    // Middle curve
    final midCurveInitial = Offset(30, size.height - 30);
    final midCurveEnd = Offset(size.width - 30, size.height - 30);

    path.quadraticBezierTo(
        midCurveInitial.dx, midCurveInitial.dy, midCurveEnd.dx, midCurveEnd.dy);


    // Second curve
    final endCurveInitial = Offset(size.width, size.height - 30);
    final endCurveEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(
        endCurveInitial.dx, endCurveInitial.dy, endCurveEnd.dx, endCurveEnd.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
