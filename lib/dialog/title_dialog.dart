import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TitleDialog extends CustomPainter {
  @override
  void paint(ui.Canvas canvas, Size size) {
    final innerShapePath = getInnerShapePath(size);

    drawOuterShadow(canvas, size);
    drawDarkerColorBG(canvas, size);
    drawFrontSaturedColor(canvas, size);
    drawShader(canvas, size);
    drawInnerShape(canvas, size, innerShapePath);
    drawInnerShapeShader(canvas, size);
    drawInnerShadow(canvas, size, innerShapePath);
  }

  void drawOuterShadow(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9233180, size.height * 0.3273900);
    path.cubicTo(
        size.width * 0.8789060,
        size.height * 0.2748060,
        size.width * 0.8090640,
        size.height * 0.2407260,
        size.width * 0.7339320,
        size.height * 0.2407260);
    path.lineTo(size.width * 0.5169420, size.height * 0.2407260);
    path.cubicTo(
        size.width * 0.5112120,
        size.height * 0.2407260,
        size.width * 0.5056180,
        size.height * 0.2409720,
        size.width * 0.5000040,
        size.height * 0.2413560);
    path.cubicTo(
        size.width * 0.4943920,
        size.height * 0.2409720,
        size.width * 0.4887600,
        size.height * 0.2407260,
        size.width * 0.4830680,
        size.height * 0.2407260);
    path.lineTo(size.width * 0.2660740, size.height * 0.2407260);
    path.cubicTo(
        size.width * 0.1909440,
        size.height * 0.2407260,
        size.width * 0.1211000,
        size.height * 0.2748060,
        size.width * 0.07668800,
        size.height * 0.3273900);
    path.cubicTo(
        size.width * 0.02893800,
        size.height * 0.3838680,
        size.width * 0.005492000,
        size.height * 0.4775920,
        size.width * 0.01469800,
        size.height * 0.5841160);
    path.cubicTo(
        size.width * 0.02389600,
        size.height * 0.6906340,
        size.width * 0.08276000,
        size.height * 0.7592760,
        size.width * 0.1865320,
        size.height * 0.7592760);
    path.lineTo(size.width * 0.8135720, size.height * 0.7592760);
    path.cubicTo(
        size.width * 0.9172460,
        size.height * 0.7592760,
        size.width * 0.9761480,
        size.height * 0.6906340,
        size.width * 0.9853140,
        size.height * 0.5841160);
    path.cubicTo(
        size.width * 0.9944800,
        size.height * 0.4775920,
        size.width * 0.9710500,
        size.height * 0.3838680,
        size.width * 0.9233180,
        size.height * 0.3273900);
    path.close();

    final matrix4 = Matrix4.identity()..translate(0.0, size.height * 0.05);

    final transformedPath = path.transform(matrix4.storage);

    final paint = Paint()
      ..color = Colors.black.withOpacity(0.35)
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        convertRadiusToSigma(15),
      );
    canvas.drawPath(transformedPath, paint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  void drawDarkerColorBG(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.9451000, size.height * 0.3076800)
      ..cubicTo(
        size.width * 0.8996800,
        size.height * 0.2542600,
        size.width * 0.8282000,
        size.height * 0.2196800,
        size.width * 0.7513400,
        size.height * 0.2196800,
      )
      ..lineTo(size.width * 0.5293400, size.height * 0.2196800)
      ..cubicTo(
          size.width * 0.5235200,
          size.height * 0.2196800,
          size.width * 0.5177400,
          size.height * 0.2199400,
          size.width * 0.5120000,
          size.height * 0.2203400)
      ..cubicTo(
          size.width * 0.5062600,
          size.height * 0.2199400,
          size.width * 0.5004800,
          size.height * 0.2196800,
          size.width * 0.4946600,
          size.height * 0.2196800)
      ..lineTo(size.width * 0.2726600, size.height * 0.2196800)
      ..cubicTo(
          size.width * 0.1958000,
          size.height * 0.2196800,
          size.width * 0.1243200,
          size.height * 0.2543200,
          size.width * 0.07890000,
          size.height * 0.3076800)
      ..cubicTo(
          size.width * 0.03000000,
          size.height * 0.3650800,
          size.width * 0.006000000,
          size.height * 0.4603000,
          size.width * 0.01546000,
          size.height * 0.5685200)
      ..cubicTo(
          size.width * 0.02492000,
          size.height * 0.6767400,
          size.width * 0.08512000,
          size.height * 0.7465200,
          size.width * 0.1911800,
          size.height * 0.7465200)
      ..lineTo(size.width * 0.8328200, size.height * 0.7465200)
      ..cubicTo(
          size.width * 0.9388200,
          size.height * 0.7465200,
          size.width * 0.9991600,
          size.height * 0.6767600,
          size.width * 1.008540,
          size.height * 0.5685200)
      ..cubicTo(
          size.width * 1.017920,
          size.height * 0.4602800,
          size.width * 0.9940000,
          size.height * 0.3650800,
          size.width * 0.9451000,
          size.height * 0.3076800)
      ..close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xffb61c18);
    canvas.drawPath(path, paint0Fill);
  }

  void drawFrontSaturedColor(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9451000, size.height * 0.2898800);
    path_1.cubicTo(
        size.width * 0.8996800,
        size.height * 0.2364600,
        size.width * 0.8282000,
        size.height * 0.2018800,
        size.width * 0.7513400,
        size.height * 0.2018800);
    path_1.lineTo(size.width * 0.5293400, size.height * 0.2018800);
    path_1.cubicTo(
        size.width * 0.5235200,
        size.height * 0.2018800,
        size.width * 0.5177400,
        size.height * 0.2021400,
        size.width * 0.5120000,
        size.height * 0.2025200);
    path_1.cubicTo(
        size.width * 0.5062600,
        size.height * 0.2021400,
        size.width * 0.5004800,
        size.height * 0.2018800,
        size.width * 0.4946600,
        size.height * 0.2018800);
    path_1.lineTo(size.width * 0.2726600, size.height * 0.2018800);
    path_1.cubicTo(
        size.width * 0.1958000,
        size.height * 0.2018800,
        size.width * 0.1243200,
        size.height * 0.2365200,
        size.width * 0.07890000,
        size.height * 0.2898800);
    path_1.cubicTo(
        size.width * 0.03000000,
        size.height * 0.3472600,
        size.width * 0.006000000,
        size.height * 0.4424800,
        size.width * 0.01546000,
        size.height * 0.5507000);
    path_1.cubicTo(
        size.width * 0.02492000,
        size.height * 0.6589200,
        size.width * 0.08512000,
        size.height * 0.7287000,
        size.width * 0.1911800,
        size.height * 0.7287000);
    path_1.lineTo(size.width * 0.8328200, size.height * 0.7287000);
    path_1.cubicTo(
        size.width * 0.9388200,
        size.height * 0.7287000,
        size.width * 0.9991600,
        size.height * 0.6589600,
        size.width * 1.008540,
        size.height * 0.5507000);
    path_1.cubicTo(
        size.width * 1.017920,
        size.height * 0.4424400,
        size.width * 0.9940000,
        size.height * 0.3472600,
        size.width * 0.9451000,
        size.height * 0.2898800);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xffe30613).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  void drawShader(Canvas canvas, Size size) {
    Path path_2 = Path()
      ..moveTo(size.width * 0.9451000, size.height * 0.2898800)
      ..cubicTo(
          size.width * 0.8996800,
          size.height * 0.2364600,
          size.width * 0.8282000,
          size.height * 0.2018800,
          size.width * 0.7513400,
          size.height * 0.2018800)
      ..lineTo(size.width * 0.5293400, size.height * 0.2018800)
      ..cubicTo(
          size.width * 0.5235200,
          size.height * 0.2018800,
          size.width * 0.5177400,
          size.height * 0.2021400,
          size.width * 0.5120000,
          size.height * 0.2025200)
      ..cubicTo(
          size.width * 0.5062600,
          size.height * 0.2021400,
          size.width * 0.5004800,
          size.height * 0.2018800,
          size.width * 0.4946600,
          size.height * 0.2018800)
      ..lineTo(size.width * 0.2726600, size.height * 0.2018800)
      ..cubicTo(
          size.width * 0.1958000,
          size.height * 0.2018800,
          size.width * 0.1243200,
          size.height * 0.2365200,
          size.width * 0.07890000,
          size.height * 0.2898800)
      ..cubicTo(
          size.width * 0.03000000,
          size.height * 0.3472600,
          size.width * 0.006000000,
          size.height * 0.4424800,
          size.width * 0.01546000,
          size.height * 0.5507000)
      ..cubicTo(
          size.width * 0.02492000,
          size.height * 0.6589200,
          size.width * 0.08512000,
          size.height * 0.7287000,
          size.width * 0.1911800,
          size.height * 0.7287000)
      ..lineTo(size.width * 0.8328200, size.height * 0.7287000)
      ..cubicTo(
          size.width * 0.9388200,
          size.height * 0.7287000,
          size.width * 0.9991600,
          size.height * 0.6589600,
          size.width * 1.008540,
          size.height * 0.5507000)
      ..cubicTo(
          size.width * 1.017920,
          size.height * 0.4424400,
          size.width * 0.9940000,
          size.height * 0.3472600,
          size.width * 0.9451000,
          size.height * 0.2898800)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
      // Offset(size.width * 0.5120000, size.height * -24.98600),
      // Offset(size.width * 0.5120000, size.height * 0.6901000),
      Offset(size.width * 0.5, size.height * -0.5),
      Offset(size.width * 0.5, size.height * 0.7),
      [
        Color(0xffffffff).withOpacity(0.2),
        Color(0xff575757).withOpacity(0.2),
        Color(0xff000000).withOpacity(0.2)
      ],
      [0.63, 0.87, 1],
    );

    var x = paint.shader;

    canvas.drawPath(
      path_2,
      paint..blendMode = BlendMode.multiply,
    );
  }

  void drawInnerShape(Canvas canvas, Size size, Path path) {
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = const Color(0xffe5221b),
    );
  }

  void drawInnerShapeShader(Canvas canvas, Size size) {
    Path path_4 = Path();
    path_4.moveTo(size.width * 0.8931000, size.height * 0.3180000);
    path_4.cubicTo(
        size.width * 0.8531000,
        size.height * 0.2731400,
        size.width * 0.7902400,
        size.height * 0.2440000,
        size.width * 0.7226000,
        size.height * 0.2440000);
    path_4.lineTo(size.width * 0.5272400, size.height * 0.2440000);
    path_4.cubicTo(
        size.width * 0.5221400,
        size.height * 0.2440000,
        size.width * 0.5170600,
        size.height * 0.2442200,
        size.width * 0.5120000,
        size.height * 0.2445400);
    path_4.cubicTo(
        size.width * 0.5069400,
        size.height * 0.2442200,
        size.width * 0.5018600,
        size.height * 0.2440000,
        size.width * 0.4967400,
        size.height * 0.2440000);
    path_4.lineTo(size.width * 0.3014000, size.height * 0.2440000);
    path_4.cubicTo(
        size.width * 0.2337600,
        size.height * 0.2440000,
        size.width * 0.1708600,
        size.height * 0.2730600,
        size.width * 0.1309000,
        size.height * 0.3180000);
    path_4.cubicTo(
        size.width * 0.08790000,
        size.height * 0.3661600,
        size.width * 0.06690000,
        size.height * 0.4460000,
        size.width * 0.07508000,
        size.height * 0.5369400);
    path_4.cubicTo(
        size.width * 0.08326000,
        size.height * 0.6278800,
        size.width * 0.1363600,
        size.height * 0.6863400,
        size.width * 0.2297000,
        size.height * 0.6863400);
    path_4.lineTo(size.width * 0.7943000, size.height * 0.6863400);
    path_4.cubicTo(
        size.width * 0.8876400,
        size.height * 0.6863400,
        size.width * 0.9406600,
        size.height * 0.6278000,
        size.width * 0.9489200,
        size.height * 0.5369400);
    path_4.cubicTo(
        size.width * 0.9571800,
        size.height * 0.4460800,
        size.width * 0.9361000,
        size.height * 0.3662000,
        size.width * 0.8931000,
        size.height * 0.3180000);
    path_4.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
        Offset(size.width * 0.5120000, size.height * 0.2441200),
        Offset(size.width * 0.5120000, size.height * 0.6863800), [
      Color(0xffffffff).withOpacity(0.26),
      Color(0xff575757).withOpacity(0.26),
      Color(0xff000000).withOpacity(0.26)
    ], [
      0,
      0.65,
      1
    ]);
    canvas.drawPath(path_4, paint..blendMode = BlendMode.colorBurn);
  }

  void drawInnerShadow(Canvas canvas, Size size, Path innerShapePath) {
    final matrix1 = Matrix4.identity()..scale(0.95);
    var smallerPath = innerShapePath.transform(matrix1.storage);

    Offset centersDiff =
        innerShapePath.getBounds().center - smallerPath.getBounds().center;

    matrix1.leftTranslate(centersDiff.dx, centersDiff.dy);

    smallerPath = innerShapePath.transform(matrix1.storage);

    final path =
        Path.combine(PathOperation.difference, innerShapePath, smallerPath);

    canvas.drawPath(
      path,
      Paint()
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(10),
        )
        ..color = Colors.black.withOpacity(0.4),
    );
  }

  Path getInnerShapePath(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.9090000, size.height * 0.3093000);
    path.cubicTo(
        size.width * 0.8673600,
        size.height * 0.2618000,
        size.width * 0.8018400,
        size.height * 0.2310000,
        size.width * 0.7313800,
        size.height * 0.2310000);
    path.lineTo(size.width * 0.5278800, size.height * 0.2310000);
    path.cubicTo(
        size.width * 0.5225600,
        size.height * 0.2310000,
        size.width * 0.5172600,
        size.height * 0.2312400,
        size.width * 0.5120000,
        size.height * 0.2315800);
    path.cubicTo(
        size.width * 0.5067400,
        size.height * 0.2312400,
        size.width * 0.5014400,
        size.height * 0.2310000,
        size.width * 0.4961200,
        size.height * 0.2310000);
    path.lineTo(size.width * 0.2926000, size.height * 0.2310000);
    path.cubicTo(
        size.width * 0.2221600,
        size.height * 0.2310000,
        size.width * 0.1566000,
        size.height * 0.2618000,
        size.width * 0.1150000,
        size.height * 0.3093000);
    path.cubicTo(
        size.width * 0.07022000,
        size.height * 0.3603400,
        size.width * 0.04824000,
        size.height * 0.4450000,
        size.width * 0.05686000,
        size.height * 0.5413000);
    path.cubicTo(
        size.width * 0.06548000,
        size.height * 0.6376000,
        size.width * 0.1207000,
        size.height * 0.6995000,
        size.width * 0.2180000,
        size.height * 0.6995000);
    path.lineTo(size.width * 0.8060000, size.height * 0.6995000);
    path.cubicTo(
        size.width * 0.9032200,
        size.height * 0.6995000,
        size.width * 0.9584600,
        size.height * 0.6375000,
        size.width * 0.9670600,
        size.height * 0.5412400);
    path.cubicTo(
        size.width * 0.9756600,
        size.height * 0.4449800,
        size.width * 0.9537800,
        size.height * 0.3603400,
        size.width * 0.9090000,
        size.height * 0.3093000);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
