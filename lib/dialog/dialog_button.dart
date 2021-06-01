import 'dart:ui';

import 'package:flutter/material.dart';

///Perfect dimension
///Size(WIDTH, (WIDTH*0.3088).toDouble()
class DialogButton extends StatelessWidget {
  const DialogButton({
    this.text = 'HOME',
    required this.onTap,
    this.shadowColor = const Color(0xFF212121),
    this.shadowBlurRadius = 10,
    this.mainShapeColor = const Color(0xFF5E8810E4),
    this.maskColor = const Color(0xff8810E4),
  });

  ///Defaults to 'HOME'.
  final String text;
  final Function() onTap;

  ///Defaults to Color(0xFF212121)
  final Color? shadowColor;

  ///Defaults to 10
  final double shadowBlurRadius;

  ///Defaults to  Color(0xff5E0499)
  final Color mainShapeColor;

  ///Defaults to Color(0xff8810E4).
  final Color maskColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, bc) {
        return Center(
          child: GestureDetector(
            onTap: onTap,
            child: SizedBox(
              width: bc.maxWidth,
              height: bc.maxHeight,
              child: CustomPaint(
                painter: DialogButtonPainter(
                  shadowColor,
                  shadowBlurRadius,
                  mainShapeColor,
                  maskColor,
                ),
                child: Center(
                  child: SizedBox(
                    width: bc.maxWidth * 0.8,
                    height: bc.maxHeight * 0.6,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: const Color(0xFFFFF04B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DialogButtonPainter extends CustomPainter {
  DialogButtonPainter(
    this.shadowColor,
    this.blurRadius,
    this.mainShapeColor,
    this.maskColor,
  );

  final Color? shadowColor;
  final double blurRadius;

  //Centers the shape on the rect.
  final xAllign = 0.0865;
  final yAllign = -0.05;

  //Colors
  final Color mainShapeColor;
  final Color maskColor;
  final Color polygonsMaskColor = const Color(0xffFFFFFF).withOpacity(0.35);
  final Color topDecorationColor = const Color(0xfff6a772).withOpacity(.38);

  void drawMainShape(Canvas canvas, Size size) {
    Path path = Path();
    //bottom right
    path.moveTo(size.width * 0.7742902, size.height * 0.9532397);

    //bottom left
    path.lineTo(size.width * 0.0511238, size.height * 0.9532397);
    path.arcToPoint(Offset(-size.width * 0.078, size.height * 0.5351101),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(-size.width * 0.078, size.height * 0.5351101);
    path.arcToPoint(Offset(size.width * 0.0511238, size.height * 0.1169805),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.7742902, size.height * 0.1169805);
    path.arcToPoint(Offset(size.width * 0.9034306, size.height * 0.5351101),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.9034306, size.height * 0.5351101);
    path.arcToPoint(Offset(size.width * 0.7742902, size.height * 0.9532397),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();

    canvas.drawPath(path, Paint()..color = mainShapeColor);
  }

  void drawMainShapeDarkerBg(Canvas canvas, Path path) {
    canvas.drawPath(
      path,
      Paint()..color = mainShapeColor,
    );
  }

  void drawGradient(Canvas canvas, Size size, Path path) {
    Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFCC55E).withOpacity(.4),
          const Color(0xFF616161).withOpacity(.42),
        ],
        center: FractionalOffset(.45, .2),
        radius: 1.5,
        stops: [0.0, 1],
      ).createShader(
        path.getBounds(),
      );
    canvas.drawPath(path, paint);
  }

  void drawMask(Canvas canvas, Size size, Path gradientPath, Paint paint) {
    double horizontalSpaceBetween = size.width * 0.1572358;

    final topLeft = Offset(
      size.width * 0.07674487 - horizontalSpaceBetween,
      size.height * 0.8544526,
    );
    final bottomLeft = Offset(
      -horizontalSpaceBetween,
      size.height * 0.8544526,
    );
    final bottomRight = Offset(
      size.width * 0.2615832 - horizontalSpaceBetween,
      size.height * 0.02649218,
    );
    final topRight = Offset(
      size.width * 0.3383281 - horizontalSpaceBetween,
      size.height * 0.02649218,
    );

    Path path = Path();

    for (int i = 0; i < 7; i++) {
      path.moveTo(topLeft.dx + i * horizontalSpaceBetween, topLeft.dy);
      path.lineTo(bottomLeft.dx + i * horizontalSpaceBetween, bottomLeft.dy);
      path.lineTo(bottomRight.dx + i * horizontalSpaceBetween, bottomRight.dy);
      path.lineTo(topRight.dx + i * horizontalSpaceBetween, topRight.dy);
      path.lineTo(topLeft.dx + i * horizontalSpaceBetween, topLeft.dy);
    }

    final matrix4 = Matrix4.identity()
      ..translate(-size.width * xAllign, size.height * 0.08);

    //This is needed to align the skewed lines on center of the shape.
    final translatedPath = path.transform(matrix4.storage);

    canvas.drawPath(
        gradientPath,
        paint
          ..color = maskColor
          ..blendMode = BlendMode.softLight);

    canvas.drawPath(
      Path.combine(PathOperation.intersect, gradientPath, translatedPath),
      paint..color = polygonsMaskColor,
    );
  }

  void drawTopDecoration(Canvas canvas, Size size) {
    Path path = Path();
    //top right
    path.moveTo(size.width * 0.9700513, size.height * 0.1002234);

    //top left
    path.lineTo(size.width * 0.0468849, size.height * 0.1002234);
    //arco left
    // path.arcToPoint(Offset(-size.width * 0.01774448, size.height * 0.5185126),
    path.arcToPoint(Offset(-size.width * 0.08225, size.height * 0.5185126),
        radius:
            Radius.elliptical(size.width * 0.1295840, size.height * 0.4195659),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    //bottom left
    path.lineTo(-size.width * 0.08225, size.height * 0.5185126);

    path.quadraticBezierTo(-size.width * 0.08225, size.height * 0.5276093,
        -size.width * 0.08225, size.height * 0.5367060);

    path.arcToPoint(Offset(size.width * 0.0468849, size.height * 0.1366103),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    //bottom right
    path.lineTo(size.width * 0.7700513, size.height * 0.1366103);
    path.arcToPoint(Offset(size.width * 0.8990931, size.height * 0.5367060),
        radius:
            Radius.elliptical(size.width * 0.1296333, size.height * 0.4197255),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.cubicTo(
        size.width * 0.8990931,
        size.height * 0.5306416,
        size.width * 0.8990931,
        size.height * 0.5245771,
        size.width * 0.8990931,
        size.height * 0.5185126);
    path.lineTo(size.width * 0.8990931, size.height * 0.5185126);
    path.arcToPoint(Offset(size.width * 0.7700513, size.height * 0.1002234),
        radius:
            Radius.elliptical(size.width * 0.1295840, size.height * 0.4195659),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.close();

    canvas.drawPath(path, Paint()..color = topDecorationColor);
  }

  Path getGradientPath(Size size) {
    final bottomLeft = Offset(size.width * 0.0511238, size.height * 0.9532397);
    final bottomRight = Offset(size.width * 0.7742902, size.height * 0.9532397);

    Path path = Path();
    //FirstPoint bottomLeft
    path.moveTo(bottomLeft.dx, bottomLeft.dy);

    //Arco Superior esquerdo
    path.arcToPoint(Offset(size.width * 0.0511238, size.height * 0.08059368),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.7742902, size.height * 0.08059368);
    //Arco inferior direito
    path.arcToPoint(bottomRight,
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();

    return path;
  }

  Path getDarkerBgPath(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.0511238, size.height * 0.9289818);
    path.arcToPoint(Offset(size.width * 0.0511238, size.height * 0.08059368),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.7742902, size.height * 0.08059368);
    path.arcToPoint(Offset(size.width * 0.7742902, size.height * 0.9289818),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();
    final matrix = Matrix4.identity()..translate(0.0, size.height * 0.06);
    final transformedPath = path.transform(matrix.storage);

    return transformedPath;
  }

  void drawShadow(Canvas canvas, Path path, Size size) {
    if (shadowColor == null) return;

    //makes a horizontally cut on the path
    canvas.save();
    canvas.translate(-size.width * xAllign, 0);

    //Clips to draw the shadow only on the bottom.
    canvas.clipRect(
      Rect.fromLTWH(0, 0, size.width, size.height / 2),
      clipOp: ClipOp.difference,
    );

    final m4 = Matrix4.identity()..translate(size.width * xAllign, 0);

    final translatedPath = path.transform(m4.storage);
    canvas.drawPath(
      translatedPath,
      Paint()
        ..style = PaintingStyle.fill
        ..color = shadowColor!
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          convertRadiusToSigma(blurRadius),
        ),
    );

    canvas.restore();
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.saveLayer(rect, paint);
    final gradientPath = getGradientPath(size);

    //Centers the shape on the rect.
    canvas.translate(size.width * xAllign, size.height * yAllign);

    final darkerBgPath = getDarkerBgPath(size);

    drawShadow(canvas, darkerBgPath, size);
    canvas.drawPath(gradientPath, paint);

    drawMainShape(canvas, size);

    drawMainShapeDarkerBg(canvas, darkerBgPath);

    canvas.saveLayer(
      gradientPath.getBounds(),
      paint,
    );

    drawMask(canvas, size, gradientPath, paint);
    drawGradient(canvas, size, gradientPath);
    drawTopDecoration(canvas, size);

    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant DialogButtonPainter oldDelegate) {
    return true;
  }
}
