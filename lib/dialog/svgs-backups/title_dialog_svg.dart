import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TitleDialogSVG extends StatelessWidget {
  final double widthRatio = 0.585981098109811;
  Size calculatesSize(BoxConstraints bc) {
    double width = bc.maxWidth;
    double height = bc.maxWidth * widthRatio;

    if (height > bc.maxHeight) {
      height = bc.maxHeight;
      width = height / widthRatio;
    }

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, bc) {
      print(bc);
      return SizedBox(
        child: Center(
          child: Container(
            color: Colors.red,
            child: CustomPaint(
              size: calculatesSize(bc),
              painter: RPSCustomPainter(),
            ),
          ),
        ),
      );
    });
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawOuterShadow(canvas, size);
    drawDarkerBG(canvas, size);
    drawSaturedColor(canvas, size);
    drawMainGradient(canvas, size);
    drawInnerShape(canvas, size);
    drawInnerShader(canvas, size);
  }

  //copied
  void drawOuterShadow(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9896940, size.height * 0.2891594);
    path.cubicTo(
        size.width * 0.9441269,
        size.height * 0.1969970,
        size.width * 0.8724572,
        size.height * 0.1374371,
        size.width * 0.7953870,
        size.height * 0.1374371);
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

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff616161).withOpacity(1.0);
    canvas.drawPath(path, paint0Fill);
  }

  //copied
  void drawDarkerBG(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9796130, size.height * 0.2221497);
    path_1.cubicTo(
        size.width * 0.9351260,
        size.height * 0.1328674,
        size.width * 0.8651215,
        size.height * 0.07507392,
        size.width * 0.7898290,
        size.height * 0.07507392);
    path_1.lineTo(size.width * 0.5723672, size.height * 0.07507392);
    path_1.cubicTo(
        size.width * 0.5666742,
        size.height * 0.07507392,
        size.width * 0.5610036,
        size.height * 0.07549633,
        size.width * 0.5553780,
        size.height * 0.07614915);
    path_1.cubicTo(
        size.width * 0.5497750,
        size.height * 0.07549633,
        size.width * 0.5441269,
        size.height * 0.07507392,
        size.width * 0.5384113,
        size.height * 0.07507392);
    path_1.lineTo(size.width * 0.3209496, size.height * 0.07507392);
    path_1.cubicTo(
        size.width * 0.2456571,
        size.height * 0.07507392,
        size.width * 0.1756526,
        size.height * 0.1329826,
        size.width * 0.1311656,
        size.height * 0.2221497);
    path_1.cubicTo(
        size.width * 0.08325833,
        size.height * 0.3181137,
        size.width * 0.05974347,
        size.height * 0.4772858,
        size.width * 0.06901440,
        size.height * 0.6581928);
    path_1.cubicTo(
        size.width * 0.07828533,
        size.height * 0.8390999,
        size.width * 0.1372637,
        size.height * 0.9557237,
        size.width * 0.2411341,
        size.height * 0.9557237);
    path_1.lineTo(size.width * 0.8696445, size.height * 0.9557237);
    path_1.cubicTo(
        size.width * 0.9734698,
        size.height * 0.9557237,
        size.width * 1.032561,
        size.height * 0.8390999,
        size.width * 1.041764,
        size.height * 0.6581928);
    path_1.cubicTo(
        size.width * 1.050968,
        size.height * 0.4772858,
        size.width * 1.027520,
        size.height * 0.3181137,
        size.width * 0.9796130,
        size.height * 0.2221497);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xffb61c18).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  //copied
  void drawSaturedColor(Canvas canvas, Size size) {
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

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Color(0xffe30613).withOpacity(1.0);
    canvas.drawPath(path, paint2Fill);
  }

  void drawMainGradient(Canvas canvas, Size size) {
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

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5555581, 0),
      Offset(size.width * 0.5555581, size.height),
      [
        Color(0xffffffff).withOpacity(0.1),
        Color(0xff575757).withOpacity(0.1),
        Color(0xff000000).withOpacity(0.1)
      ],
      [0.63, 0.87, 1],
    );
    canvas.drawPath(path, paint3Fill);
  }

  void drawInnerShape(Canvas canvas, Size size) {
    Path path_4 = Path();
    path_4.moveTo(size.width * 0.9286904, size.height * 0.2394301);
    path_4.cubicTo(
        size.width * 0.8894914,
        size.height * 0.1644330,
        size.width * 0.8279253,
        size.height * 0.1157022,
        size.width * 0.7616787,
        size.height * 0.1157022);
    path_4.lineTo(size.width * 0.5704095, size.height * 0.1157022);
    path_4.cubicTo(
        size.width * 0.5654140,
        size.height * 0.1157022,
        size.width * 0.5604410,
        size.height * 0.1160862,
        size.width * 0.5554680,
        size.height * 0.1166238);
    path_4.cubicTo(
        size.width * 0.5505176,
        size.height * 0.1160862,
        size.width * 0.5455446,
        size.height * 0.1157022,
        size.width * 0.5405266,
        size.height * 0.1157022);
    path_4.lineTo(size.width * 0.3492574, size.height * 0.1157022);
    path_4.cubicTo(
        size.width * 0.2830108,
        size.height * 0.1157022,
        size.width * 0.2213996,
        size.height * 0.1642794,
        size.width * 0.1822457,
        size.height * 0.2394301);
    path_4.cubicTo(
        size.width * 0.1401215,
        size.height * 0.3200722,
        size.width * 0.1195545,
        size.height * 0.4533620,
        size.width * 0.1275653,
        size.height * 0.6053915);
    path_4.cubicTo(
        size.width * 0.1355761,
        size.height * 0.7574210,
        size.width * 0.1876013,
        size.height * 0.8549979,
        size.width * 0.2790279,
        size.height * 0.8549979);
    path_4.lineTo(size.width * 0.8319082, size.height * 0.8549979);
    path_4.cubicTo(
        size.width * 0.9233348,
        size.height * 0.8549979,
        size.width * 0.9752700,
        size.height * 0.7571522,
        size.width * 0.9833483,
        size.height * 0.6053915);
    path_4.cubicTo(
        size.width * 0.9914266,
        size.height * 0.4536308,
        size.width * 0.9707921,
        size.height * 0.3199954,
        size.width * 0.9286904,
        size.height * 0.2394301);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xffe52518).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);
  }

  void drawInnerShader(Canvas canvas, Size size) {
    Path path_5 = Path();
    path_5.moveTo(size.width * 0.9286904, size.height * 0.2394301);
    path_5.cubicTo(
        size.width * 0.8894914,
        size.height * 0.1644330,
        size.width * 0.8279253,
        size.height * 0.1157022,
        size.width * 0.7616787,
        size.height * 0.1157022);
    path_5.lineTo(size.width * 0.5704095, size.height * 0.1157022);
    path_5.cubicTo(
        size.width * 0.5654140,
        size.height * 0.1157022,
        size.width * 0.5604410,
        size.height * 0.1160862,
        size.width * 0.5554680,
        size.height * 0.1166238);
    path_5.cubicTo(
        size.width * 0.5505176,
        size.height * 0.1160862,
        size.width * 0.5455446,
        size.height * 0.1157022,
        size.width * 0.5405266,
        size.height * 0.1157022);
    path_5.lineTo(size.width * 0.3492574, size.height * 0.1157022);
    path_5.cubicTo(
        size.width * 0.2830108,
        size.height * 0.1157022,
        size.width * 0.2213996,
        size.height * 0.1642794,
        size.width * 0.1822457,
        size.height * 0.2394301);
    path_5.cubicTo(
        size.width * 0.1401215,
        size.height * 0.3200722,
        size.width * 0.1195545,
        size.height * 0.4533620,
        size.width * 0.1275653,
        size.height * 0.6053915);
    path_5.cubicTo(
        size.width * 0.1355761,
        size.height * 0.7574210,
        size.width * 0.1876013,
        size.height * 0.8549979,
        size.width * 0.2790279,
        size.height * 0.8549979);
    path_5.lineTo(size.width * 0.8319082, size.height * 0.8549979);
    path_5.cubicTo(
        size.width * 0.9233348,
        size.height * 0.8549979,
        size.width * 0.9752700,
        size.height * 0.7571522,
        size.width * 0.9833483,
        size.height * 0.6053915);
    path_5.cubicTo(
        size.width * 0.9914266,
        size.height * 0.4536308,
        size.width * 0.9707921,
        size.height * 0.3199954,
        size.width * 0.9286904,
        size.height * 0.2394301);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5555806, 0),
      Offset(size.width * 0.5555806, size.height),
      [
        Color(0xffffffff).withOpacity(0.3),
        Color(0xff575757).withOpacity(0.3),
        Color(0xff000000).withOpacity(0.3)
      ],
      [0, 0.65, 1],
    );
    canvas.drawPath(path_5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
