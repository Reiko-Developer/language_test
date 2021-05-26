import 'package:flutter/material.dart';

class PlayingWithSaveLayer extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    // mySaveLayerTest(canvas);
    // docsTest(canvas, size);
    myBg(canvas, size);
  }

  void myBg(Canvas canvas, Size size) {
    //BG
    final paint = Paint()
      ..color = Colors.green
      ..blendMode = BlendMode.src;
    canvas.saveLayer(
      null,
      paint,
    );

    canvas.drawPaint(paint);

    //Custom shape Layer
    final path = Path()
      ..moveTo(100, 100)
      ..lineTo(300, 100)
      ..lineTo(300, 300)
      ..lineTo(100, 300)
      ..lineTo(100, 100)
      ..close();

    canvas.clipPath(path);

    canvas.saveLayer(
      path.getBounds(),
      Paint()..blendMode = BlendMode.difference,
    );

    canvas.drawPaint(Paint()..color = Colors.green.withOpacity(0.5));

    final path2 = Path()
      ..addOval(Rect.fromCircle(center: Offset(200, 200), radius: 50));

    canvas.drawPath(path2, Paint()..color = Colors.black);

    canvas.restore();
    canvas.restore();
  }

  docsTest(Canvas canvas, Size size) {
    method1(canvas, size);

    // method2(canvas, size);

    // method3(canvas, size);
  }

  void method1(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.save();
    canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
    canvas.saveLayer(rect, Paint());
    canvas.drawPaint(new Paint()..color = Colors.red);
    canvas.drawPaint(new Paint()..color = Colors.white);
    canvas.restore();
    canvas.restore();
  }

  void method2(Canvas canvas, Size size) {
    // (this example renders poorly, prefer the example above)
    Rect rect = Offset.zero & size;
    canvas.save();
    canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
    canvas.drawPaint(new Paint()..color = Colors.red);
    canvas.drawPaint(new Paint()..color = Colors.white);
    canvas.restore();
  }

  void method3(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRRect(RRect.fromRectXY(Offset.zero & (size / 2.0), 50.0, 50.0));
    canvas.drawPaint(Paint()..color = Colors.red);
    canvas.drawPaint(Paint()..color = Colors.white);
    canvas.restore();
    canvas.save();
    canvas.clipRRect(
      RRect.fromRectXY(size.center(Offset.zero) & (size / 2.0), 50.0, 50.0),
    );
    canvas.drawPaint(Paint()..color = Colors.white);
    canvas.restore();
  }

  mySaveLayerTest(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(25.0, 50.0, 300.0, 350.0),
      Paint()..color = Colors.green,
    );

    canvas.drawRect(
      Rect.fromLTWH(50.0, 100.0, 100.0, 100.0),
      Paint()..color = Colors.red,
    );

    canvas.saveLayer(null, Paint()..blendMode = BlendMode.multiply);

    canvas.drawRect(
      Rect.fromLTWH(100.0, 150.0, 100.0, 100.0),
      Paint()..color = Colors.blue,
    );

    canvas.restore();

    canvas.drawRect(
      Rect.fromLTWH(150.0, 200.0, 100.0, 100.0),
      Paint()..color = Colors.yellow,
    );

    canvas.saveLayer(
      null,
      Paint()..blendMode = BlendMode.hardLight,
    );

    canvas.drawRect(
      Rect.fromLTWH(200.0, 250.0, 100.0, 100.0),
      Paint()..color = Colors.purple,
    );
  }

  bool shouldRepaint(PlayingWithSaveLayer old) {
    return true;
  }
}
