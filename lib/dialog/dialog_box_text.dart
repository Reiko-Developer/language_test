import 'package:flutter/material.dart';

class DialogBoxText extends StatelessWidget {
  const DialogBoxText({
    required this.title,
    required this.text,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
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
        ),
        Expanded(
          flex: 6,
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

  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final blurRadius = size.width * 0.02;

    final paint = Paint();
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, externalRadius),
      paint..color = const Color(0xffEB6619),
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

    drawInnerShapeWithShadows(canvas, innerRect, blurRadius);
  }

  void drawInnerShapeWithShadows(
      Canvas canvas, Rect innerRect, double blurRadius) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, externalRadius),
      Paint()..color = const Color(0xffE8701A),
    );

    canvas.saveLayer(
      innerRect,
      Paint()..blendMode = BlendMode.multiply,
    );
    //Creates the shadow
    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, externalRadius),
      Paint()..color = const Color(0xff450000),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(innerRect, externalRadius),
      Paint()
        ..color = Colors.white
        ..maskFilter = MaskFilter.blur(BlurStyle.inner, blurRadius),
    );

    var transformed = Rect.fromLTWH(
      innerRect.left + 2 * blurRadius,
      innerRect.top + blurRadius,
      innerRect.width - 4 * blurRadius,
      innerRect.height - blurRadius * 2,
    );

    transformed = transformed.translate(0, blurRadius);

    canvas.drawRRect(
      RRect.fromRectAndRadius(transformed, externalRadius),
      Paint()
        ..color = Colors.white
        ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10),
    );

    canvas.restore();
  }

  bool shouldRepaint(CustomTextBox old) {
    return true;
  }
}
