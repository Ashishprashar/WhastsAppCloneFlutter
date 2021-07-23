import 'dart:math';

import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  // const StatusItem({ Key? key }) : super(key: key);
  final bool view;

  StatusItem(this.view);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(view),
        child: CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(
            "https://assets.entrepreneur.com/content/3x2/2000/20190502194704-ent19-june-editorsnote.jpeg?width=700&crop=2:1",
          ),
        ),
      ),
      title: Text(
        "User1",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("10 minutes ago"),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusPainter extends CustomPainter {
  final bool view;

  StatusPainter(this.view);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 8.0
      ..color = Colors.greenAccent.shade700
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    double degree = -90;
    double arc = 360 / 6;
    if (view) {
      for (int i = 0; i < 6; i++) {
        paint.color = Colors.grey;
        canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    } else {
      for (int i = 0; i < 3; i++) {
        paint.color = Colors.greenAccent.shade400;
        canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
      for (int i = 0; i < 3; i++) {
        paint.color = Colors.grey;
        canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
