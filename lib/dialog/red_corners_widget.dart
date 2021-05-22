import 'package:flutter/material.dart';

class RedCornerWidget extends StatelessWidget {
  RedCornerWidget(this.size, this.strokeWidth, this.color);

  final Size size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: RedCornerPainter(strokeWidth, color),
    );
  }
}

class RedCornerPainter extends CustomPainter {
  RedCornerPainter(this.strokeWidth, this.color);
  final double strokeWidth;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    double cornerSize = size.shortestSide * 0.1;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    //TopLeft
    canvas.drawLine(
      Offset(strokeWidth / 2, strokeWidth / 2),
      Offset(cornerSize, strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(strokeWidth / 2, 0),
      Offset(strokeWidth / 2, cornerSize),
      paint,
    );
    //
    // =============
    // TopRight
    canvas.drawLine(
      Offset(size.width - cornerSize, strokeWidth / 2),
      Offset(size.width, strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - strokeWidth / 2, 0),
      Offset(size.width - strokeWidth / 2, cornerSize),
      paint,
    );

    //
    // =============
    // BottomLeft
    canvas.drawLine(
      Offset(strokeWidth / 2, size.height - strokeWidth / 2),
      Offset(cornerSize, size.height - strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(strokeWidth / 2, size.height - cornerSize),
      Offset(strokeWidth / 2, size.height),
      paint,
    );

    //
    // =============
    // BottomRight
    canvas.drawLine(
      Offset(size.width - cornerSize, size.height - strokeWidth / 2),
      Offset(size.width, size.height - strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - strokeWidth / 2, size.height - cornerSize),
      Offset(size.width - strokeWidth / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(RedCornerPainter old) {
    return true;
  }
}
