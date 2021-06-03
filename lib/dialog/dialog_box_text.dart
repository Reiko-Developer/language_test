import 'package:flutter/material.dart';

class DialogBoxText extends StatelessWidget {
  const DialogBoxText({
    required this.title,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF9B1313),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              CustomPaint(
                size: Size.infinite,
                painter: CustomTextBox(),
              ),
              SizedBox.fromSize(
                size: Size.infinite,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextBox extends CustomPainter {
  final externalRadius = Radius.circular(250);
  // final innerRectRadius = Radius.circular(15);

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

    drawInnerShapeWithShadows(canvas, innerRect);
  }

  void drawInnerShapeWithShadows(Canvas canvas, Rect innerRect) {
    // Draws the shadow
    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, externalRadius),
      Paint()..color = const Color(0xff000000),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, externalRadius),
      Paint()
        ..color = const Color(0xffd8701b)
        ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3),
    );
  }

  bool shouldRepaint(CustomTextBox old) {
    return true;
  }
}
