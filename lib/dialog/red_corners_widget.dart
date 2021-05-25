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
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    //TopLeft
    canvas.drawLine(
      Offset(strokeWidth / 2, strokeWidth / 2),
      Offset(cornerSize + strokeWidth / 2, strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(strokeWidth / 2, strokeWidth / 2),
      Offset(strokeWidth / 2, cornerSize + strokeWidth / 2),
      paint,
    );
    //
    // =============
    // TopRight
    canvas.drawLine(
      Offset(size.width - (cornerSize + strokeWidth / 2), strokeWidth / 2),
      Offset(size.width - strokeWidth / 2, strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - strokeWidth / 2, strokeWidth / 2),
      Offset(size.width - strokeWidth / 2, cornerSize + strokeWidth / 2),
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
      Offset(strokeWidth / 2, size.height - (cornerSize + strokeWidth / 2)),
      Offset(strokeWidth / 2, size.height - strokeWidth / 2),
      paint,
    );

    //
    // =============
    // BottomRight
    canvas.drawLine(
      Offset(size.width - (cornerSize + strokeWidth / 2),
          size.height - strokeWidth / 2),
      Offset(size.width - strokeWidth / 2, size.height - strokeWidth / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - strokeWidth / 2,
          size.height - (cornerSize + strokeWidth / 2)),
      Offset(size.width - strokeWidth / 2, size.height - strokeWidth / 2),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.longestSide / 2,
      paint..color = Colors.green.withOpacity(0.4),
    );
  }

  @override
  bool shouldRepaint(RedCornerPainter old) {
    return true;
  }
}
