import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class DialogWithCustomPainterV1 extends CustomPainter {
  factory DialogWithCustomPainterV1({
    Color color = const Color(0xFFF8BC24),
    double borderWidth = 15,
    double borderSize = 80,
    double? cornersRadius,
    double? dotsRadius,
  }) {
    cornersRadius = cornersRadius ?? borderWidth;
    if (cornersRadius < 0) cornersRadius = 0;

    dotsRadius = dotsRadius ?? borderWidth / 2;
    return DialogWithCustomPainterV1._internal(
      color,
      borderSize,
      cornersRadius,
      borderWidth,
      dotsRadius,
    );
  }

  DialogWithCustomPainterV1._internal(
    this.color,
    this.borderSize,
    this.cornersRadius,
    this.borderWidth,
    this.dotsRadius,
  );

  final Color color;

  ///Must be >= 0
  ///TODO: divide into: cornerSize.x and cs.y
  final double borderSize;
  final double borderWidth;
  //defaults to half of the borderWidth
  final double dotsRadius;
  final Color dotsColor = const Color(0xFFe6381f);
  final Radius externalRectRadius = Radius.circular(30);
  final Radius internalRectRadius = Radius.circular(20);
  final double shadowWidth = 10;

  ///Applies this value as the radius of the half circle on each corner.
  ///Defaults to the value of the borderWidth.
  ///If a negative cornerRadius is passed receives, sets to 0.
  final double cornersRadius;

  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF981d1b)
      ..style = PaintingStyle.fill;

    //Red background container rect
    final biggestRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      externalRectRadius,
    );

    canvas.drawRRect(biggestRect, paint);

    final clippedPath = getClippedBorderPath(size);
    canvas.drawPath(clippedPath, paint..color = color);

    drawBackgroundOverlayShadow(canvas, clippedPath, biggestRect.outerRect);

    drawPoints(canvas, size);

    drawInnerShadow(canvas, size);

    final innerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth + shadowWidth,
        borderWidth + shadowWidth,
        size.width - 2 * (borderWidth + shadowWidth),
        size.height - 2 * (borderWidth + shadowWidth),
      ),
      internalRectRadius,
    );

    canvas.drawRRect(innerRect, paint..color = color);
  }

  void drawInnerShadow(Canvas canvas, Size size) {
    final outerShadowRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth + shadowWidth,
        borderWidth + shadowWidth,
        size.width - 2 * (borderWidth + shadowWidth),
        size.height - 2 * (borderWidth + shadowWidth),
      ),
      internalRectRadius,
    );

    final innerShadowRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth,
        borderWidth,
        size.width - 2 * borderWidth,
        size.height - 2 * borderWidth,
      ),
      internalRectRadius,
    );

    //TODO: Create issue of this
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRRect(innerShadowRect),
        Path()..addRRect(outerShadowRect),
      ),
      Paint()
        ..color = Colors.black.withAlpha(55)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(30),
        ),
    );
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  drawPoints(Canvas canvas, Size size) {
    if (dotsRadius <= 0) return;

    final paint = Paint()
      ..color = dotsColor
      ..strokeWidth = dotsRadius
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final points = [
      Offset(borderWidth / 2, borderSize - borderWidth / 2),
      Offset(borderSize - borderWidth / 2, borderWidth / 2),
      Offset(size.width - borderSize + borderWidth / 2, borderWidth / 2),
      Offset(size.width - borderWidth / 2, borderSize - borderWidth / 2),
      Offset(
        size.width - borderWidth / 2,
        size.height - borderSize + borderWidth / 2,
      ),
      Offset(
        size.width - borderSize + borderWidth / 2,
        size.height - borderWidth / 2,
      ),
      Offset(
        borderSize - borderWidth / 2,
        size.height - borderWidth / 2,
      ),
      Offset(
        borderWidth / 2,
        size.height - borderSize + borderWidth / 2,
      ),
    ];
    canvas.drawPoints(PointMode.points, points, paint);
  }

  void drawBackgroundOverlayShadow(
      Canvas canvas, Path clippedPath, Rect shaderRect) {
    final gradient = LinearGradient(
      colors: [
        const Color(0xFFFFFFFF),
        const Color(0xFFeaeaea),
        const Color(0xFFd1d1d1),
        const Color(0xFFaeaeae),
        const Color(0xFF818181),
        const Color(0xFF494949),
        const Color(0xFF494949),
        const Color(0xFF090909),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.0,
        0.01,
        0.02,
        0.07,
        0.55,
        0.85,
        0.93,
        1,
      ],
    );

    final shaderPainter = Paint()
      ..shader = gradient.createShader(shaderRect)
      ..blendMode = BlendMode.overlay;

    canvas.drawPath(clippedPath, shaderPainter);
  }

  //Returns the path clipping the border.
  //TODO: Try adding RoundedRectangles on the place of arcTo
  Path getClippedBorderPath(Size size) {
    final internalRect = Rect.fromLTWH(
      borderWidth,
      borderWidth,
      size.width - borderWidth * 2,
      size.height - borderWidth * 2,
    );

    final internalRoundedRect = Path()
      ..addRRect(RRect.fromRectAndRadius(internalRect, internalRectRadius));

    final clipsTheBordersWithTheCorners = Path()
      ..lineTo(0, borderSize)
      ..lineTo(0, size.height - borderSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderWidth / 2, size.height - borderSize),
          width: borderWidth,
          height: cornersRadius,
        ),
        pi,
        pi,
        false,
      )
      ..lineTo(borderSize, size.height - borderSize)
      ..lineTo(borderSize, size.height - borderWidth)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderSize, size.height - borderWidth / 2),
          width: cornersRadius,
          height: borderWidth,
        ),
        1.5 * pi,
        pi,
        false,
      )
      ..lineTo(size.width - borderSize, size.height)
      ..arcTo(
        Rect.fromCenter(
          center:
              Offset(size.width - borderSize, size.height - borderWidth / 2),
          width: cornersRadius,
          height: borderWidth,
        ),
        0.5 * pi,
        pi,
        false,
      )
      ..lineTo(size.width - borderSize, size.height - borderSize)
      ..lineTo(size.width - borderWidth, size.height - borderSize)
      ..arcTo(
        Rect.fromCenter(
          center:
              Offset(size.width - borderWidth / 2, size.height - borderSize),
          width: borderWidth,
          height: cornersRadius,
        ),
        pi,
        pi,
        false,
      )
      ..lineTo(size.width, borderSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width - borderWidth / 2, borderSize),
          width: borderWidth,
          height: cornersRadius,
        ),
        0,
        pi,
        false,
      )
      ..lineTo(size.width - borderSize, borderSize)
      ..lineTo(size.width - borderSize, 0)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width - borderSize, borderWidth / 2),
          width: cornersRadius,
          height: borderWidth,
        ),
        0.5 * pi,
        pi,
        false,
      )
      ..lineTo(borderSize, 0)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderSize, borderWidth / 2),
          width: cornersRadius,
          height: borderWidth,
        ),
        1.5 * pi,
        pi,
        false,
      )
      ..lineTo(borderSize, borderSize)
      ..lineTo(borderWidth, borderSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderWidth / 2, borderSize),
          width: borderWidth,
          height: cornersRadius,
        ),
        0,
        pi,
        false,
      )
      ..lineTo(0, borderSize);

    return Path.combine(
      PathOperation.union,
      clipsTheBordersWithTheCorners,
      internalRoundedRect,
    );
  }

  bool shouldRepaint(DialogWithCustomPainterV1 old) {
    return true;
  }
}
