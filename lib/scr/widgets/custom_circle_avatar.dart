import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: Colors.black, width: 6)),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 35,
          child: CustomPaint(
            painter: _CustomIcon(),
          )
          //  Icon(
          //   CupertinoIcons.person,
          //   color: Colors.black,
          //   size: 64,
          // ),
          ),
    );
  }
}

class _CustomIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6.0;
    canvas.drawCircle(const Offset(0, -14), 11, paint);

    final path = Path();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6.0;

    path.moveTo(-22, 33);
    path.quadraticBezierTo(-15, 12, 0, 12);
    path.quadraticBezierTo(15, 12, 22, 33);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
