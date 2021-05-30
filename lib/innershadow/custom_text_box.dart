import 'package:flutter/material.dart';

class CustomTextBox extends CustomPainter {
  final externalRadius = Radius.circular(20);
  final innerRectRadius = Radius.circular(15);

  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final paint = Paint();
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, externalRadius),
      paint
        ..color = const Color(0xffEB6109)
        ..shader = null,
    );

    canvas.saveLayer(rect, paint..blendMode = BlendMode.softLight);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, externalRadius),
      paint
        ..shader = LinearGradient(
          colors: [
            const Color(0xff000000),
            const Color(0xffffffff),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(rect),
    );

    canvas.restore();

    final double sidesBorderWidth = size.shortestSide * 0.08;
    final double topBottomBorderWidth = sidesBorderWidth * 0.2;

    final innerRect = Rect.fromLTWH(
      sidesBorderWidth,
      topBottomBorderWidth,
      size.width - 2 * sidesBorderWidth,
      size.height - 2 * topBottomBorderWidth,
    );

    canvas.saveLayer(innerRect, Paint()..blendMode = BlendMode.srcATop);
    drawInnerShape(canvas, innerRect);
    canvas.saveLayer(innerRect, Paint()..blendMode = BlendMode.multiply);

    drawMainShadow(canvas, innerRect);
    drawInnerShapeLessOpaqueShadow(canvas, innerRect);

    canvas.restore();
    canvas.restore();
  }

  ///Draws the inner shape with their shadows
  void drawMainShadow(Canvas canvas, Rect innerRect) {
    final double sideBordersWidth = innerRect.width * 0.01;
    final double topBotBordersWidth = innerRect.width * 0.01;

    var moreOpaqueInnerRect = Rect.fromLTWH(
      innerRect.left + sideBordersWidth,
      innerRect.top + topBotBordersWidth,
      innerRect.width - 2 * sideBordersWidth,
      innerRect.height - topBotBordersWidth,
    );

    //draws the soft light shadow
    var paint = Paint()..color = const Color(0xFF000000).withOpacity(0.5);

    //Draws the innerShapeInnerShadow
    canvas.drawDRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      RRect.fromRectAndRadius(moreOpaqueInnerRect, Radius.circular(10)),
      paint,
    );

    for (int i = 0; i < 2; i++)
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          moreOpaqueInnerRect,
          Radius.circular(10),
        ),
        paint
          ..color = Colors.white
          ..maskFilter = MaskFilter.blur(
            BlurStyle.normal,
            convertRadiusToSigma(topBotBordersWidth),
          ),
      );
  }

  void drawInnerShapeLessOpaqueShadow(Canvas canvas, Rect innerRect) {
    var lessOpaqueInnerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        innerRect.left + 8,
        innerRect.top + 3,
        innerRect.width - 16,
        innerRect.height - 3,
      ),
      Radius.circular(10),
    );

    //Draws the innerShapeInnerShadow
    canvas.drawDRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      lessOpaqueInnerRect,
      Paint()
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(10),
        )
        ..color = Colors.black.withOpacity(0.25),
    );
  }

  void drawInnerShape(Canvas canvas, Rect innerRect) {
    //draws the innerShape with a less opaque shadow
    final paint = Paint()..blendMode = BlendMode.multiply;

    // Draws the main color of the inner shape.
    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      paint
        ..color = const Color(0xffD8701C)
        ..maskFilter = null,
    );
  }

  ///Draws the inner shape with their shadows
  void drawInnerShapeV1(Canvas canvas, Rect innerRect) {
    //
    // //draws the soft light shadow
    var paint = Paint();
    //       //
    //       ..blendMode = BlendMode.softLight
    //     //
    //     ;

    // canvas.saveLayer(innerRect, paint);
    // final double sideBordersWidth = innerRect.width * 0.07;
    // final double topBotBordersWidth = innerRect.width * 0.03;

    //Draws the innerShapeInnerShadow
    //TODO: apply Luigi's innerShadow
    // canvas.drawDRRect(
    //   RRect.fromRectAndRadius(innerRect, innerRectRadius),
    //   moreOpaqueInnerRect,
    //   paint
    //     ..color = Colors.black
    //     ..maskFilter = MaskFilter.blur(
    //       BlurStyle.inner,
    //       convertRadiusToSigma(20),
    //     ),
    // );

    // var moreOpaqueInnerRect = RRect.fromRectAndRadius(
    //   Rect.fromLTWH(
    //     innerRect.left + sideBordersWidth,
    //     innerRect.top + topBotBordersWidth,
    //     innerRect.width - 2 * sideBordersWidth,
    //     innerRect.height - topBotBordersWidth,
    //   ),
    //   Radius.circular(10),
    // );

    // //Draws the innerShapeInnerShadow
    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(innerRect, innerRectRadius),
    //   paint
    //     ..color = Colors.black
    //     ..maskFilter = MaskFilter.blur(
    //       BlurStyle.inner,
    //       convertRadiusToSigma(20),
    //     )
    //     ..shader = RadialGradient(
    //       colors: [Colors.red, Colors.green],
    //     ).createShader(innerRect),
    // );

    // canvas.drawRRect(
    //   moreOpaqueInnerRect,
    //   paint..color = const Color(0xFFF8BC24).withOpacity(0),
    // );

    //draws the innerShape with a less opaque shadow
    paint = Paint()..blendMode = BlendMode.multiply;
    canvas.saveLayer(innerRect, paint);
    var lessOpaqueInnerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        innerRect.left + 8,
        innerRect.top + 3,
        innerRect.width - 16,
        innerRect.height - 3,
      ),
      Radius.circular(10),
    );

    //Draws the innerShapeInnerShadow
    canvas.drawDRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      lessOpaqueInnerRect,
      paint
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(10),
        )
        ..color = Colors.black.withOpacity(1),
    );

    // Draws the main color of the inner shape.
    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      paint
        ..color = const Color(0xffD8701C)
        ..maskFilter = null,
    );

    canvas.restore();
    canvas.restore();
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  bool shouldRepaint(CustomTextBox old) {
    return true;
  }
}
