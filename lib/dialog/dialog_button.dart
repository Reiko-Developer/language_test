import 'package:flutter/material.dart';

///Size(WIDTH, (WIDTH*0.3088).toDouble()
class DialogButton extends StatelessWidget {
  const DialogButton({this.text = 'HOME'});

  final String text;

  Size getSize(BoxConstraints bc) {
    double width = bc.maxWidth, height = bc.maxWidth * .3088;

    if (height > bc.maxHeight) {
      height = bc.maxHeight;
      width = height / .3088;
    }

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, bc) {
        final size = getSize(bc);

        return Center(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                // color: Colors.green,
                ),
            child: CustomPaint(
              size: Size(size.width, size.height),
              painter: DialogButtonPainter(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.77,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'asd',
                        style: TextStyle(
                          color: const Color(0xFFFFF04B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DialogButtonPainter extends CustomPainter {
  ///Size(WIDTH, (WIDTH*0.3088).toDouble()
  const DialogButtonPainter();

  void drawMainShape(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.6742902, size.height * 0.9532397);
    path.lineTo(size.width * 0.1511238, size.height * 0.9532397);
    path.arcToPoint(Offset(size.width * 0.02198344, size.height * 0.5351101),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.02198344, size.height * 0.5351101);
    path.arcToPoint(Offset(size.width * 0.1511238, size.height * 0.1169805),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.6742902, size.height * 0.1169805);
    path.arcToPoint(Offset(size.width * 0.8034306, size.height * 0.5351101),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.8034306, size.height * 0.5351101);
    path.arcToPoint(Offset(size.width * 0.6742902, size.height * 0.9532397),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();

    canvas.drawPath(path, Paint()..color = Color(0xff5E0499));
  }

  void drawMainShapeDarkerBg(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1511238, size.height * 0.9289818);
    path.arcToPoint(Offset(size.width * 0.1511238, size.height * 0.08059368),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.6742902, size.height * 0.08059368);
    path.arcToPoint(Offset(size.width * 0.6742902, size.height * 0.9289818),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();
    final matrix = Matrix4.identity()..translate(0.0, size.height * 0.06);
    final transformedPath = path.transform(matrix.storage);

    canvas.drawPath(transformedPath,
        Paint()..color = const Color(0xff5E0499).withOpacity(1.0));
  }

  void drawGradient(Canvas canvas, Size size, Path path) {
    Paint paint = Paint()
      ..shader = RadialGradient(
          colors: [
            const Color(0xFFFCC55E).withOpacity(.42),
            const Color(0xFF616161).withOpacity(.42),
          ],
          center: FractionalOffset(.45, .25),
          radius: 1,
          // focal: FractionalOffset(.5, .05),
          // focalRadius: 0.3,
          stops: [0.0, 1]).createShader(
        path.getBounds(),
      );
    canvas.drawPath(path, paint);
  }

  void drawMask(Canvas canvas, Size size, Path gradientPath, Paint paint) {
    Path path = Path();
    path.moveTo(size.width * 0.07674487, size.height * 0.8544526);
    path.lineTo(0, size.height * 0.8544526);
    path.lineTo(size.width * 0.2615832, size.height * 0.02649218);
    path.lineTo(size.width * 0.3383281, size.height * 0.02649218);
    path.lineTo(size.width * 0.07674487, size.height * 0.8544526);

    path.moveTo(size.width * 0.2339807, size.height * 0.8544526);
    path.lineTo(size.width * 0.1572358, size.height * 0.8544526);
    path.lineTo(size.width * 0.4188190, size.height * 0.02649218);
    path.lineTo(size.width * 0.4955639, size.height * 0.02649218);
    path.lineTo(size.width * 0.2339807, size.height * 0.8544526);

    path.moveTo(size.width * 0.4043277, size.height * 0.8544526);
    path.lineTo(size.width * 0.3275335, size.height * 0.8544526);
    path.lineTo(size.width * 0.5891660, size.height * 0.02649218);
    path.lineTo(size.width * 0.6658616, size.height * 0.02649218);
    path.lineTo(size.width * 0.4043277, size.height * 0.8544526);

    path.moveTo(size.width * 0.5821175, size.height * 0.8544526);
    path.lineTo(size.width * 0.5053726, size.height * 0.8544526);
    path.lineTo(size.width * 0.7669558, size.height * 0.02649218);
    path.lineTo(size.width * 0.8437007, size.height * 0.02649218);
    path.lineTo(size.width * 0.5821175, size.height * 0.8544526);

    path.moveTo(size.width * 0.7384168, size.height * 0.8544526);
    path.lineTo(size.width * 0.6616719, size.height * 0.8544526);
    path.lineTo(size.width * 0.9232551, size.height * 0.02649218);
    path.lineTo(size.width, size.height * 0.02649218);
    path.lineTo(size.width * 0.7384168, size.height * 0.8544526);
    path.close();

    final matrix4 = Matrix4.identity()
      ..translate(-size.width * 0.0865, size.height * 0.08);

    //This is needed to align the skewed lines on center of the shape.
    final translatedPath = path.transform(matrix4.storage);

    canvas.drawPath(
        gradientPath,
        paint
          ..color = const Color(0xff8810E4)
          ..blendMode = BlendMode.softLight);

    canvas.drawPath(
      Path.combine(PathOperation.intersect, gradientPath, translatedPath),
      paint..color = const Color(0xffFFFFFF).withOpacity(0.35),
    );
  }

  void drawTopDecoration(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.6700513, size.height * 0.1002234);
    path.lineTo(size.width * 0.1468849, size.height * 0.1002234);
    path.arcToPoint(Offset(size.width * 0.01774448, size.height * 0.5185126),
        radius:
            Radius.elliptical(size.width * 0.1295840, size.height * 0.4195659),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.01774448, size.height * 0.5185126);
    path.quadraticBezierTo(size.width * 0.01774448, size.height * 0.5276093,
        size.width * 0.01774448, size.height * 0.5367060);
    path.arcToPoint(Offset(size.width * 0.1468849, size.height * 0.1366103),
        radius:
            Radius.elliptical(size.width * 0.1295347, size.height * 0.4194063),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.6700513, size.height * 0.1366103);
    path.arcToPoint(Offset(size.width * 0.7990931, size.height * 0.5367060),
        radius:
            Radius.elliptical(size.width * 0.1296333, size.height * 0.4197255),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.cubicTo(
        size.width * 0.7990931,
        size.height * 0.5306416,
        size.width * 0.7990931,
        size.height * 0.5245771,
        size.width * 0.7990931,
        size.height * 0.5185126);
    path.lineTo(size.width * 0.7990931, size.height * 0.5185126);
    path.arcToPoint(Offset(size.width * 0.6700513, size.height * 0.1002234),
        radius:
            Radius.elliptical(size.width * 0.1295840, size.height * 0.4195659),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.close();

    Paint paint19Fill = Paint()..style = PaintingStyle.fill;
    paint19Fill.color = Color(0xfff6a772).withOpacity(.38);
    canvas.drawPath(path, paint19Fill);
  }

  Path getGradientPath(Size size) {
    final bottomLeft = Offset(size.width * 0.1511238, size.height * 0.9532397);
    final bottomRight = Offset(size.width * 0.6742902, size.height * 0.9532397);

    Path path = Path();
    //FirstPoint bottomLeft
    path.moveTo(bottomLeft.dx, bottomLeft.dy);

    //Arco Superior esquerdo
    path.arcToPoint(Offset(size.width * 0.1511238, size.height * 0.08059368),
        radius:
            Radius.elliptical(size.width * 0.1310134, size.height * 0.4241941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.6742902, size.height * 0.08059368);
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

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradientPath = getGradientPath(size);

    canvas.saveLayer(rect, paint);

    //Centers the shape on the rect.
    canvas.translate(size.width * 0.0865, -size.height * 0.05);
    canvas.drawPath(gradientPath, paint);

    drawMainShape(canvas, size);
    drawMainShapeDarkerBg(canvas, size);

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
