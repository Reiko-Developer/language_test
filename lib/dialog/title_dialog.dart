import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TitleDialog extends StatelessWidget {
  TitleDialog({
    this.backgroundColor = const Color(0xffb61c18),
    this.outerColor = const Color(0xffe30613),
    this.innerColor = const Color(0xffe5221b),
  });

  ///Defaults to const Color(0xFFB61C18).
  ///
  final Color backgroundColor;

  ///Defaults to const Color(0xFFE30613).
  ///
  final Color outerColor;

  ///Defaults to const Color(0xFFE5221B).
  ///
  final Color innerColor;

  ///The correct ratio for the title custom Painter size.
  final double _widthRatio = 0.585981098109811;

  final TextStyle titleTextStyle = TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.yellow,
    shadows: [
      Shadow(
        blurRadius: 2,
        color: Colors.black54,
        offset: Offset(0, 1.5),
      ),
    ],
  );

  Size getPainterSize(BoxConstraints bc) {
    double width = bc.maxWidth;
    double height = bc.maxWidth * _widthRatio;

    if (height > bc.maxHeight) {
      height = bc.maxHeight;
      width = height / _widthRatio;
    }

    return Size(width, height);
  }

  Size getTextContainerdSize(BoxConstraints bc) {
    final painterSize = getPainterSize(bc);

    return Size(painterSize.width * 0.75, painterSize.height * 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, bc) => Stack(
        alignment: Alignment.center,
        children: [
          // Container(color: Colors.green),
          Center(
            child: Container(
              // color: Colors.white,
              child: CustomPaint(
                size: getPainterSize(bc),
                painter: TitleDialogPainter(
                  backgroundColor,
                  outerColor,
                  innerColor,
                ),
              ),
            ),
          ),

          ///This transformation is needed to align the center of the child-Widget
          ///with the center of the title dialog ignoring the shadow height.
          ///
          Transform.translate(
            offset: Offset(0, -bc.biggest.shortestSide * 0.045),

            ///Makes the child-widget be the same height and width
            //of the title-dialog without the outer shadows.
            child: SizedBox.fromSize(
              size: getTextContainerdSize(bc),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        'LEVEL\nCOMPLETE',
                        style: titleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleDialogPainter extends CustomPainter {
  TitleDialogPainter(this.backgroundColor, this.outerColor, this.innerColor);

  final Color backgroundColor;
  final Color outerColor;
  final Color innerColor;

  @override
  void paint(ui.Canvas canvas, Size size) {
    final innerShapePath = getInnerShapePath(size);
    alignShapeOnCanvas(canvas, size);
    drawOuterShadow(canvas, size);
    drawDarkerColorBG(canvas, size);
    drawFrontSaturedColor(canvas, size);
    drawShader(canvas, size);
    drawInnerShape(canvas, size, innerShapePath);
    drawInnerShapeShader(canvas, size);
    drawInnerShadow(canvas, size, innerShapePath);
  }

  ///This action is needed because the shape is slightly translated to the top-right angle.
  ///
  void alignShapeOnCanvas(Canvas canvas, Size size) {
    double dxValueToTranslateTheCanvas = size.width / 100 * 5.3;
    double dyValueToTranslateTheCanvas = size.height / 100 * 3;

    canvas.translate(
      -dxValueToTranslateTheCanvas,
      -dyValueToTranslateTheCanvas,
    );
  }

  void drawOuterShadow(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9896940, size.height * 0.2891594);
    path.cubicTo(
      size.width * 0.9441269,
      size.height * 0.1969970,
      size.width * 0.8724572,
      size.height * 0.1374371,
      size.width * 0.7953870,
      size.height * 0.1374371,
    );
    path.lineTo(size.width * 0.5727723, size.height * 0.1374371);
    path.cubicTo(
        size.width * 0.5668767,
        size.height * 0.1374371,
        size.width * 0.5611386,
        size.height * 0.1378979,
        size.width * 0.5553780,
        size.height * 0.1385507);
    path.cubicTo(
        size.width * 0.5496175,
        size.height * 0.1378979,
        size.width * 0.5438569,
        size.height * 0.1374371,
        size.width * 0.5380063,
        size.height * 0.1374371);
    path.lineTo(size.width * 0.3153915, size.height * 0.1374371);
    path.cubicTo(
        size.width * 0.2383213,
        size.height * 0.1374371,
        size.width * 0.1666517,
        size.height * 0.1971122,
        size.width * 0.1210846,
        size.height * 0.2891594);
    path.cubicTo(
        size.width * 0.07211971,
        size.height * 0.3880419,
        size.width * 0.04799730,
        size.height * 0.5521293,
        size.width * 0.05747075,
        size.height * 0.7384509);
    path.cubicTo(
        size.width * 0.06694419,
        size.height * 0.9247725,
        size.width * 0.1272277,
        size.height * 1.045160,
        size.width * 0.2337984,
        size.height * 1.045160);
    path.lineTo(size.width * 0.8770702, size.height * 1.045160);
    path.cubicTo(
        size.width * 0.9834608,
        size.height * 1.045160,
        size.width * 1.043879,
        size.height * 0.9249645,
        size.width * 1.053398,
        size.height * 0.7384509);
    path.cubicTo(
        size.width * 1.062916,
        size.height * 0.5519373,
        size.width * 1.038659,
        size.height * 0.3880419,
        size.width * 0.9896940,
        size.height * 0.2891594);
    path.close();

    final paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        _convertRadiusToSigma(5),
      );
    canvas.drawPath(path, paint);
  }

  ///Used to create a MaskFilter.
  ///0 is totally opaque and 180 is very disperse.
  static double _convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  void drawDarkerColorBG(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.9796130, size.height * 0.2221497);
    path.cubicTo(
        size.width * 0.9351260,
        size.height * 0.1328674,
        size.width * 0.8651215,
        size.height * 0.07507392,
        size.width * 0.7898290,
        size.height * 0.07507392);
    path.lineTo(size.width * 0.5723672, size.height * 0.07507392);
    path.cubicTo(
        size.width * 0.5666742,
        size.height * 0.07507392,
        size.width * 0.5610036,
        size.height * 0.07549633,
        size.width * 0.5553780,
        size.height * 0.07614915);
    path.cubicTo(
        size.width * 0.5497750,
        size.height * 0.07549633,
        size.width * 0.5441269,
        size.height * 0.07507392,
        size.width * 0.5384113,
        size.height * 0.07507392);
    path.lineTo(size.width * 0.3209496, size.height * 0.07507392);
    path.cubicTo(
        size.width * 0.2456571,
        size.height * 0.07507392,
        size.width * 0.1756526,
        size.height * 0.1329826,
        size.width * 0.1311656,
        size.height * 0.2221497);
    path.cubicTo(
        size.width * 0.08325833,
        size.height * 0.3181137,
        size.width * 0.05974347,
        size.height * 0.4772858,
        size.width * 0.06901440,
        size.height * 0.6581928);
    path.cubicTo(
        size.width * 0.07828533,
        size.height * 0.8390999,
        size.width * 0.1372637,
        size.height * 0.9557237,
        size.width * 0.2411341,
        size.height * 0.9557237);
    path.lineTo(size.width * 0.8696445, size.height * 0.9557237);
    path.cubicTo(
        size.width * 0.9734698,
        size.height * 0.9557237,
        size.width * 1.032561,
        size.height * 0.8390999,
        size.width * 1.041764,
        size.height * 0.6581928);
    path.cubicTo(
        size.width * 1.050968,
        size.height * 0.4772858,
        size.width * 1.027520,
        size.height * 0.3181137,
        size.width * 0.9796130,
        size.height * 0.2221497);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = backgroundColor;
    canvas.drawPath(path, paint);
  }

  void drawFrontSaturedColor(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9796130, size.height * 0.1923889);
    path.cubicTo(
        size.width * 0.9351260,
        size.height * 0.1031066,
        size.width * 0.8651215,
        size.height * 0.04531316,
        size.width * 0.7898290,
        size.height * 0.04531316);
    path.lineTo(size.width * 0.5723672, size.height * 0.04531316);
    path.cubicTo(
        size.width * 0.5666742,
        size.height * 0.04531316,
        size.width * 0.5610036,
        size.height * 0.04573557,
        size.width * 0.5553780,
        size.height * 0.04638839);
    path.cubicTo(
        size.width * 0.5497750,
        size.height * 0.04573557,
        size.width * 0.5441269,
        size.height * 0.04531316,
        size.width * 0.5384113,
        size.height * 0.04531316);
    path.lineTo(size.width * 0.3209496, size.height * 0.04531316);
    path.cubicTo(
        size.width * 0.2456571,
        size.height * 0.04531316,
        size.width * 0.1756526,
        size.height * 0.1032218,
        size.width * 0.1311656,
        size.height * 0.1923889);
    path.cubicTo(
        size.width * 0.08325833,
        size.height * 0.2883146,
        size.width * 0.05974347,
        size.height * 0.4474867,
        size.width * 0.06901440,
        size.height * 0.6283937);
    path.cubicTo(
        size.width * 0.07828533,
        size.height * 0.8093007,
        size.width * 0.1372637,
        size.height * 0.9259245,
        size.width * 0.2411341,
        size.height * 0.9259245);
    path.lineTo(size.width * 0.8696445, size.height * 0.9259245);
    path.cubicTo(
        size.width * 0.9734698,
        size.height * 0.9259245,
        size.width * 1.032561,
        size.height * 0.8093391,
        size.width * 1.041764,
        size.height * 0.6283937);
    path.cubicTo(
        size.width * 1.050968,
        size.height * 0.4474483,
        size.width * 1.027520,
        size.height * 0.2883146,
        size.width * 0.9796130,
        size.height * 0.1923889);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = outerColor;
    canvas.drawPath(path, paint);
  }

  void drawShader(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9796130, size.height * 0.1923889);
    path.cubicTo(
        size.width * 0.9351260,
        size.height * 0.1031066,
        size.width * 0.8651215,
        size.height * 0.04531316,
        size.width * 0.7898290,
        size.height * 0.04531316);
    path.lineTo(size.width * 0.5723672, size.height * 0.04531316);
    path.cubicTo(
        size.width * 0.5666742,
        size.height * 0.04531316,
        size.width * 0.5610036,
        size.height * 0.04573557,
        size.width * 0.5553780,
        size.height * 0.04638839);
    path.cubicTo(
        size.width * 0.5497750,
        size.height * 0.04573557,
        size.width * 0.5441269,
        size.height * 0.04531316,
        size.width * 0.5384113,
        size.height * 0.04531316);
    path.lineTo(size.width * 0.3209496, size.height * 0.04531316);
    path.cubicTo(
        size.width * 0.2456571,
        size.height * 0.04531316,
        size.width * 0.1756526,
        size.height * 0.1032218,
        size.width * 0.1311656,
        size.height * 0.1923889);
    path.cubicTo(
        size.width * 0.08325833,
        size.height * 0.2883146,
        size.width * 0.05974347,
        size.height * 0.4474867,
        size.width * 0.06901440,
        size.height * 0.6283937);
    path.cubicTo(
        size.width * 0.07828533,
        size.height * 0.8093007,
        size.width * 0.1372637,
        size.height * 0.9259245,
        size.width * 0.2411341,
        size.height * 0.9259245);
    path.lineTo(size.width * 0.8696445, size.height * 0.9259245);
    path.cubicTo(
        size.width * 0.9734698,
        size.height * 0.9259245,
        size.width * 1.032561,
        size.height * 0.8093391,
        size.width * 1.041764,
        size.height * 0.6283937);
    path.cubicTo(
        size.width * 1.050968,
        size.height * 0.4474483,
        size.width * 1.027520,
        size.height * 0.2883146,
        size.width * 0.9796130,
        size.height * 0.1923889);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
      // Offset(size.width * 0.5120000, size.height * -24.98600),
      // Offset(size.width * 0.5120000, size.height * 0.6901000),
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height * 0.7),
      [
        Color(0xffffffff).withOpacity(0.2),
        Color(0xff575757).withOpacity(0.2),
        Color(0xff000000).withOpacity(0.2)
      ],
      [0.63, 0.87, 1],
    );

    canvas.drawPath(
      path,
      paint..blendMode = BlendMode.multiply,
    );
  }

  void drawInnerShape(Canvas canvas, Size size, Path path) {
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..color = innerColor,
    );
  }

  void drawInnerShapeShader(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9286904, size.height * 0.2394301);
    path.cubicTo(
        size.width * 0.8894914,
        size.height * 0.1644330,
        size.width * 0.8279253,
        size.height * 0.1157022,
        size.width * 0.7616787,
        size.height * 0.1157022);
    path.lineTo(size.width * 0.5704095, size.height * 0.1157022);
    path.cubicTo(
        size.width * 0.5654140,
        size.height * 0.1157022,
        size.width * 0.5604410,
        size.height * 0.1160862,
        size.width * 0.5554680,
        size.height * 0.1166238);
    path.cubicTo(
        size.width * 0.5505176,
        size.height * 0.1160862,
        size.width * 0.5455446,
        size.height * 0.1157022,
        size.width * 0.5405266,
        size.height * 0.1157022);
    path.lineTo(size.width * 0.3492574, size.height * 0.1157022);
    path.cubicTo(
        size.width * 0.2830108,
        size.height * 0.1157022,
        size.width * 0.2213996,
        size.height * 0.1642794,
        size.width * 0.1822457,
        size.height * 0.2394301);
    path.cubicTo(
        size.width * 0.1401215,
        size.height * 0.3200722,
        size.width * 0.1195545,
        size.height * 0.4533620,
        size.width * 0.1275653,
        size.height * 0.6053915);
    path.cubicTo(
        size.width * 0.1355761,
        size.height * 0.7574210,
        size.width * 0.1876013,
        size.height * 0.8549979,
        size.width * 0.2790279,
        size.height * 0.8549979);
    path.lineTo(size.width * 0.8319082, size.height * 0.8549979);
    path.cubicTo(
        size.width * 0.9233348,
        size.height * 0.8549979,
        size.width * 0.9752700,
        size.height * 0.7571522,
        size.width * 0.9833483,
        size.height * 0.6053915);
    path.cubicTo(
        size.width * 0.9914266,
        size.height * 0.4536308,
        size.width * 0.9707921,
        size.height * 0.3199954,
        size.width * 0.9286904,
        size.height * 0.2394301);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.shader = ui.Gradient.linear(
        Offset(size.width * 0.5120000, size.height * 0.2441200),
        Offset(size.width * 0.5120000, size.height * 0.6863800), [
      Color(0xffffffff).withOpacity(0.2),
      Color(0xff575757).withOpacity(0.15),
      Color(0xff000000).withOpacity(0.15)
    ], [
      0,
      0.65,
      1
    ]);
    canvas.drawPath(path, paint..blendMode = BlendMode.colorBurn);
  }

  ///The created shadow uses for non-web platforms the maskFilter.blur.
  ///
  ///Actually the Path.Combine is not working correct for the web, this way
  ///we created a new Layer wich isolates the shadow with their blend mode.
  ///
  ///If this is not maked the blend.mode for the shadow would applied to all
  ///the other drawings too, which we don't want.
  ///
  ///TODO: test if the second approach is the best.
  void drawInnerShadow(Canvas canvas, Size size, Path innerShapePath) {
    final matrix1 = Matrix4.identity()..scale(0.95);
    var smallerPath = innerShapePath.transform(matrix1.storage);

    Offset centersDiff =
        innerShapePath.getBounds().center - smallerPath.getBounds().center;

    matrix1.leftTranslate(centersDiff.dx, centersDiff.dy);

    smallerPath = innerShapePath.transform(matrix1.storage);

    if (!kIsWeb) {
      final path =
          Path.combine(PathOperation.difference, innerShapePath, smallerPath);

      canvas.drawPath(
        path,
        Paint()
          ..maskFilter = MaskFilter.blur(
            BlurStyle.inner,
            _convertRadiusToSigma(10),
          )
          ..color = Colors.black.withOpacity(0.4),
      );
    } else {
      final paint = Paint()
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          _convertRadiusToSigma(50),
        )
        ..color = Colors.black.withOpacity(0.7);

      canvas.saveLayer(innerShapePath.getBounds(), paint);
      canvas.drawPath(innerShapePath, paint);
      canvas.drawPath(
        smallerPath,
        Paint()
          ..color = Colors.transparent
          ..blendMode = BlendMode.src,
      );
      canvas.restore();
    }
  }

  Path getInnerShapePath(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9286904, size.height * 0.2394301);
    path.cubicTo(
        size.width * 0.8894914,
        size.height * 0.1644330,
        size.width * 0.8279253,
        size.height * 0.1157022,
        size.width * 0.7616787,
        size.height * 0.1157022);
    path.lineTo(size.width * 0.5704095, size.height * 0.1157022);
    path.cubicTo(
        size.width * 0.5654140,
        size.height * 0.1157022,
        size.width * 0.5604410,
        size.height * 0.1160862,
        size.width * 0.5554680,
        size.height * 0.1166238);
    path.cubicTo(
        size.width * 0.5505176,
        size.height * 0.1160862,
        size.width * 0.5455446,
        size.height * 0.1157022,
        size.width * 0.5405266,
        size.height * 0.1157022);
    path.lineTo(size.width * 0.3492574, size.height * 0.1157022);
    path.cubicTo(
        size.width * 0.2830108,
        size.height * 0.1157022,
        size.width * 0.2213996,
        size.height * 0.1642794,
        size.width * 0.1822457,
        size.height * 0.2394301);
    path.cubicTo(
        size.width * 0.1401215,
        size.height * 0.3200722,
        size.width * 0.1195545,
        size.height * 0.4533620,
        size.width * 0.1275653,
        size.height * 0.6053915);
    path.cubicTo(
        size.width * 0.1355761,
        size.height * 0.7574210,
        size.width * 0.1876013,
        size.height * 0.8549979,
        size.width * 0.2790279,
        size.height * 0.8549979);
    path.lineTo(size.width * 0.8319082, size.height * 0.8549979);
    path.cubicTo(
        size.width * 0.9233348,
        size.height * 0.8549979,
        size.width * 0.9752700,
        size.height * 0.7571522,
        size.width * 0.9833483,
        size.height * 0.6053915);
    path.cubicTo(
        size.width * 0.9914266,
        size.height * 0.4536308,
        size.width * 0.9707921,
        size.height * 0.3199954,
        size.width * 0.9286904,
        size.height * 0.2394301);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != this.runtimeType) return false;

    return other is TitleDialogPainter &&
        other.backgroundColor == backgroundColor &&
        other.innerColor == innerColor &&
        other.outerColor == outerColor;
  }

  @override
  int get hashCode => hashValues(backgroundColor, innerColor, outerColor);

  @override
  String toString() {
    return 'TitleDialog($backgroundColor, $innerColor, $outerColor)';
  }
}
