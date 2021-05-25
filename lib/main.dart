import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_game_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Center(
            child: Container(
              width: 400,
              height: 600,
              child: CustomPaint(
                painter: Test(
                  borderWidth: 20,
                  cornersRadius: 10,
                  borderSize: 80,
                  dotsRadius: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Test extends CustomPainter {
  factory Test({
    double borderWidth = 15,
    double borderSize = 80,
    double? cornersRadius,
    double? dotsRadius,
  }) {
    cornersRadius = cornersRadius ?? borderWidth;
    if (cornersRadius < 0) cornersRadius = 0;

    dotsRadius = dotsRadius ?? borderWidth / 2;
    return Test._internal(
      borderSize,
      cornersRadius,
      borderWidth,
      dotsRadius,
    );
  }

  Test._internal(
    this.borderSize,
    this.cornersRadius,
    this.borderWidth,
    this.dotsRadius,
  );

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
        Rect.fromLTWH(0, 0, size.width, size.height), externalRectRadius);

    canvas.drawRRect(biggestRect, paint);

    canvas.drawPath(getClippedBorderPath(size), paint..color = Colors.yellow);

    if (dotsRadius > 0)
      canvas.drawPoints(
        PointMode.points,
        getDotsPoints(size),
        paint
          ..color = dotsColor
          ..strokeWidth = dotsRadius
          ..strokeCap = StrokeCap.round,
      );

    final shadowRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(
        borderWidth,
        borderWidth,
        size.width - borderWidth,
        size.height - 2 * borderWidth,
      ),
      internalRectRadius,
    );

    canvas.drawShadow(
      Path()..addRRect(shadowRect),
      Colors.black,
      shadowWidth,
      false,
    );

    final innerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth + shadowWidth,
        borderWidth + shadowWidth,
        size.width - 2 * (borderWidth + shadowWidth),
        size.height - 2 * (borderWidth + shadowWidth),
      ),
      internalRectRadius,
    );

    canvas.drawRRect(innerRect, paint..color = Colors.yellow);

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
      ..shader = gradient.createShader(biggestRect.outerRect)
      ..blendMode = BlendMode.softLight;

    // canvas.drawRRect(biggestRect, shaderPainter);
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

  List<Offset> getDotsPoints(Size size) {
    return [
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
  }

  bool shouldRepaint(Test old) {
    return true;
  }
}
