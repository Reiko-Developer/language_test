import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_box_shadow.dart';

class DialogBackground extends StatelessWidget {
  factory DialogBackground({
    double borderWidth = 20,
    double cornerEllipsisElevation = 10,
    double cornersSize = 80,
    Color mainColor = const Color(0xFFF8bc24),
    double externalRectCornerRadius = 30.0,
    double internalRectCornerRadius = 40.0,
    double? shadowWidth,
    Color cornersColor = const Color(0xFF981D1B),
    double? cornerDecorationRadius,
    Color cornerDecorationColor = const Color(4293277727),
    StrokeCap cornerDecorationStrokeCap = StrokeCap.round,
    Widget? child,
  }) {
    shadowWidth = shadowWidth ?? borderWidth * 0.25;
    cornerDecorationRadius = cornerDecorationRadius ?? borderWidth * 0.5;

    return DialogBackground._internal(
      borderWidth: borderWidth,
      cornerDecorationColor: cornerDecorationColor,
      cornerDecorationRadius: cornerDecorationRadius,
      cornerDecorationStrokeCap: cornerDecorationStrokeCap,
      cornerEllipsisElevation: cornerEllipsisElevation,
      cornersColor: cornersColor,
      cornersSize: cornersSize,
      mainColor: mainColor,
      externalRectCornerRadius: externalRectCornerRadius,
      internalRectCornerRadius: internalRectCornerRadius,
      shadowWidth: shadowWidth,
      child: child,
    );
  }

  DialogBackground._internal({
    required this.borderWidth,
    required this.cornerEllipsisElevation,
    required this.cornersSize,
    required this.mainColor,
    required this.externalRectCornerRadius,
    required this.internalRectCornerRadius,
    required this.shadowWidth,
    required this.cornersColor,
    required this.cornerDecorationRadius,
    required this.cornerDecorationColor,
    required this.cornerDecorationStrokeCap,
    required this.child,
  });

  ///Defaults to 20px;
  final double borderWidth;
  final double externalRectCornerRadius;
  final double internalRectCornerRadius;
  final Color mainColor;
  final double cornerEllipsisElevation;

  ///Defaults to borderWidth * 0.25;
  final double shadowWidth;

  //Corners section
  final double cornersSize;
  final Color cornersColor;

  ///CornersDecorationsection
  ///
  ///Defaults to half of the [borderWidth]
  final double cornerDecorationRadius;

  ///Defaults to const Color(4293277727)
  final Color cornerDecorationColor;

  ///Defaults to StrokeCap.round
  final StrokeCap cornerDecorationStrokeCap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, cc) => Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: cc.maxWidth,
              height: cc.maxHeight,
              child: CustomPaint(
                painter: BoxDialogPainter(
                  borderWidth: borderWidth,
                  cornerEllipsisElevation: cornerEllipsisElevation,
                  cornerSize: cornersSize,
                  cornersDecorationRadius: cornerDecorationRadius,
                  mainColor: mainColor,
                  externalRectCornerRadius:
                      Radius.circular(externalRectCornerRadius),
                  internalRectCornerRadius:
                      Radius.circular(internalRectCornerRadius),
                  shadowWidth: shadowWidth,
                  cornersDecorationColor: cornerDecorationColor,
                  cornersColor: cornersColor,
                  cornersDecorationStrokeCap: cornerDecorationStrokeCap,
                ),
              ),
            ),
            SizedBox(
              width: cc.maxWidth - 2 * (borderWidth + shadowWidth),
              height: cc.maxHeight - 2 * (borderWidth + shadowWidth),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(internalRectCornerRadius),
                  boxShadow: [
                    CustomBoxShadow(
                      blurRadius: shadowWidth * 1.3,
                      spreadRadius: shadowWidth * 1.3,
                      blurStyle: BlurStyle.solid,
                      color: Colors.black.withAlpha(40),
                    ),
                    CustomBoxShadow(
                      blurRadius: shadowWidth * 0.3,
                      spreadRadius: shadowWidth * 0.5,
                      blurStyle: BlurStyle.solid,
                      color: Colors.white.withAlpha(30),
                    ),
                  ],
                ),
              ),
            ),
            if (child != null)
              SizedBox(
                width: cc.maxWidth - 2 * (borderWidth + shadowWidth),
                height: cc.maxHeight - 2 * (borderWidth + shadowWidth),
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}

class BoxDialogPainter extends CustomPainter {
  BoxDialogPainter({
    required this.mainColor,
    required this.cornerSize,
    required this.cornerEllipsisElevation,
    required this.borderWidth,
    required this.externalRectCornerRadius,
    required this.internalRectCornerRadius,
    required this.shadowWidth,
    required this.cornersColor,
    required this.cornersDecorationRadius,
    required this.cornersDecorationColor,
    required this.cornersDecorationStrokeCap,
  });

  final Color mainColor;

  ///Must be >= 0
  ///TODO: divide into: cornerSize.x and cs.y
  final double borderWidth;
  final Radius externalRectCornerRadius;
  final Radius internalRectCornerRadius;
  final double shadowWidth;

  ///Corners section
  ///
  final double cornerSize;
  final Color cornersColor;

  ///Applies this value as the radius of the half circle on each corner.
  ///Defaults to the value of the borderWidth.
  ///If a negative cornerRadius is passed receives, sets to 0.
  final double cornerEllipsisElevation;

  ///Dots section
  final double? cornersDecorationRadius;
  final Color cornersDecorationColor;
  final StrokeCap cornersDecorationStrokeCap;

  void paint(Canvas canvas, Size size) {
    drawMainBackgroundColor(canvas, size);

    drawSoftLightShadow(canvas, size);

    drawInternalRectOpacity(canvas, size);

    drawInternalGradientRect(canvas, size);

    drawCorners(canvas, size);

    drawPoints(canvas, size);
  }

  void drawMainBackgroundColor(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, externalRectCornerRadius);

    canvas.drawRRect(
      rrect,
      Paint()..color = mainColor,
    );
  }

  void drawSoftLightShadow(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = LinearGradient(
      colors: [
        const Color(0xFFffffff),
        const Color(0xFFFAFAFA),
        const Color(0xFFeaeaea),
        const Color(0xFFd1d1d1),
        const Color(0xFFaeaeae),
        const Color(0xFF818181),
        const Color(0xFF494949),
        const Color(0xFF090909),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.0,
        0.1,
        0.22,
        0.36,
        0.51,
        0.66,
        0.82,
        1,
      ],
    );

    final shaderPainter = Paint()
      ..shader = gradient.createShader(rect)
      ..blendMode = BlendMode.softLight;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, externalRectCornerRadius), shaderPainter);
  }

  void drawInternalRectOpacity(Canvas canvas, Size size) {
    double internalBorder = borderWidth * 0.75;
    final rect = Rect.fromLTWH(
      internalBorder,
      internalBorder,
      size.width - 2 * internalBorder,
      size.height - 2 * internalBorder,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        Radius.circular(borderWidth),
      ),
      Paint()
        ..color = mainColor.withOpacity(0.44)
        ..blendMode = BlendMode.multiply,
    );
  }

  void drawInternalGradientRect(Canvas canvas, Size size) {
    final borderAndShadow = borderWidth + shadowWidth;
    final rect = Rect.fromLTWH(
      borderAndShadow,
      borderAndShadow,
      size.width - 2 * borderAndShadow,
      size.height - 2 * borderAndShadow,
    );

    final gradient = RadialGradient(
      colors: [
        const Color(0xFF5e5e5e),
        const Color(0xFF595959),
        const Color(0xFF4b494a),
        const Color(0xFF333031),
        const Color(0xFF231f20),
      ],
      stops: [0, 0.23, 0.51, 0.82, 1],
    ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, internalRectCornerRadius),
      Paint()
        ..color = mainColor.withOpacity(0.44)
        ..shader = gradient
        ..blendMode = BlendMode.overlay,
    );
  }

  void drawCorners(Canvas canvas, Size size) {
    final corners = Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            externalRectCornerRadius,
          ),
        ),
      getClippedBorderPath(size),
    );
    canvas.drawPath(
      corners,
      Paint()..color = cornersColor,
    );
  }

  void drawPoints(Canvas canvas, Size size) {
    if (cornersDecorationRadius == null || cornersDecorationRadius! <= 0)
      return;

    final paint = Paint()
      ..color = cornersDecorationColor
      ..strokeWidth = cornersDecorationRadius!
      ..strokeCap = cornersDecorationStrokeCap
      ..style = PaintingStyle.stroke;
    final points = [
      Offset(borderWidth / 2, cornerSize - borderWidth / 2),
      Offset(cornerSize - borderWidth / 2, borderWidth / 2),
      Offset(size.width - cornerSize + borderWidth / 2, borderWidth / 2),
      Offset(size.width - borderWidth / 2, cornerSize - borderWidth / 2),
      Offset(
        size.width - borderWidth / 2,
        size.height - cornerSize + borderWidth / 2,
      ),
      Offset(
        size.width - cornerSize + borderWidth / 2,
        size.height - borderWidth / 2,
      ),
      Offset(
        cornerSize - borderWidth / 2,
        size.height - borderWidth / 2,
      ),
      Offset(
        borderWidth / 2,
        size.height - cornerSize + borderWidth / 2,
      ),
    ];
    canvas.drawPoints(PointMode.points, points, paint);
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
      ..addRRect(
          RRect.fromRectAndRadius(internalRect, internalRectCornerRadius));

    final clipsTheBordersWithTheCorners = Path()
      ..lineTo(0, cornerSize)
      ..lineTo(0, size.height - cornerSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderWidth / 2, size.height - cornerSize),
          width: borderWidth,
          height: cornerEllipsisElevation,
        ),
        pi,
        pi,
        false,
      )
      ..lineTo(cornerSize, size.height - cornerSize)
      ..lineTo(cornerSize, size.height - borderWidth)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(cornerSize, size.height - borderWidth / 2),
          width: cornerEllipsisElevation,
          height: borderWidth,
        ),
        1.5 * pi,
        pi,
        false,
      )
      ..lineTo(size.width - cornerSize, size.height)
      ..arcTo(
        Rect.fromCenter(
          center:
              Offset(size.width - cornerSize, size.height - borderWidth / 2),
          width: cornerEllipsisElevation,
          height: borderWidth,
        ),
        0.5 * pi,
        pi,
        false,
      )
      ..lineTo(size.width - cornerSize, size.height - cornerSize)
      ..lineTo(size.width - borderWidth, size.height - cornerSize)
      ..arcTo(
        Rect.fromCenter(
          center:
              Offset(size.width - borderWidth / 2, size.height - cornerSize),
          width: borderWidth,
          height: cornerEllipsisElevation,
        ),
        pi,
        pi,
        false,
      )
      ..lineTo(size.width, cornerSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width - borderWidth / 2, cornerSize),
          width: borderWidth,
          height: cornerEllipsisElevation,
        ),
        0,
        pi,
        false,
      )
      ..lineTo(size.width - cornerSize, cornerSize)
      ..lineTo(size.width - cornerSize, 0)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width - cornerSize, borderWidth / 2),
          width: cornerEllipsisElevation,
          height: borderWidth,
        ),
        0.5 * pi,
        pi,
        false,
      )
      ..lineTo(cornerSize, 0)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(cornerSize, borderWidth / 2),
          width: cornerEllipsisElevation,
          height: borderWidth,
        ),
        1.5 * pi,
        pi,
        false,
      )
      ..lineTo(cornerSize, cornerSize)
      ..lineTo(borderWidth, cornerSize)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(borderWidth / 2, cornerSize),
          width: borderWidth,
          height: cornerEllipsisElevation,
        ),
        0,
        pi,
        false,
      )
      ..lineTo(0, cornerSize);

    return Path.combine(
      PathOperation.union,
      clipsTheBordersWithTheCorners,
      internalRoundedRect,
    );
  }

  bool shouldRepaint(BoxDialogPainter old) {
    return true;
  }
}
