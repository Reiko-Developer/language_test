import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TitleDialogSVG extends StatelessWidget {
  Size calculatesSize(BoxConstraints bc) {
    double width = bc.maxWidth;
    double height = bc.maxWidth * 0.589;

    if (height > bc.maxHeight) {
      height = bc.maxHeight;
      width = height / 0.589;
    }

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, bc) {
      final size = calculatesSize(bc);

      return SizedBox(
        child: Center(
          child: CustomPaint(
            size: Size(size.width, size.height),
            painter: RPSCustomPainter(),
          ),
        ),
      );
    });
  }
}

//Size(WIDTH, (WIDTH*0.5892187794946472).toDouble())
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9892569, size.height * 0.2568914);
    path_0.cubicTo(
        size.width * 0.9410076,
        size.height * 0.1599718,
        size.width * 0.8651279,
        size.height * 0.09713079,
        size.width * 0.7835230,
        size.height * 0.09713079);
    path_0.lineTo(size.width * 0.5477940, size.height * 0.09713079);
    path_0.cubicTo(
        size.width * 0.5415710,
        size.height * 0.09713079,
        size.width * 0.5354931,
        size.height * 0.09758845,
        size.width * 0.5293946,
        size.height * 0.09829255);
    path_0.cubicTo(
        size.width * 0.5232960,
        size.height * 0.09758845,
        size.width * 0.5171766,
        size.height * 0.09713079,
        size.width * 0.5109951,
        size.height * 0.09713079);
    path_0.lineTo(size.width * 0.2752661, size.height * 0.09713079);
    path_0.cubicTo(
        size.width * 0.1936612,
        size.height * 0.09713079,
        size.width * 0.1177815,
        size.height * 0.1599718,
        size.width * 0.06953217,
        size.height * 0.2568914);
    path_0.cubicTo(
        size.width * 0.01767345,
        size.height * 0.3610280,
        size.width * -0.007861782,
        size.height * 0.5338145,
        size.width * 0.002178066,
        size.height * 0.7301883);
    path_0.cubicTo(
        size.width * 0.01221791,
        size.height * 0.9265622,
        size.width * 0.07612860,
        size.height * 1.053160,
        size.width * 0.1888695,
        size.height * 1.053160);
    path_0.lineTo(size.width * 0.8700234, size.height * 1.053160);
    path_0.cubicTo(
        size.width * 0.9826605,
        size.height * 1.053160,
        size.width * 1.046633,
        size.height * 0.9265974,
        size.width * 1.056715,
        size.height * 0.7301883);
    path_0.cubicTo(
        size.width * 1.066796,
        size.height * 0.5337793,
        size.width * 1.041116,
        size.height * 0.3610280,
        size.width * 0.9892569,
        size.height * 0.2568914);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color.fromRGBO(97, 97, 97, 1.0).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9802335, size.height * 0.5415948);
    path_1.cubicTo(
        size.width * 0.9331251,
        size.height * 0.4475620,
        size.width * 0.8589878,
        size.height * 0.3866925,
        size.width * 0.7792706,
        size.height * 0.3866925);
    path_1.lineTo(size.width * 0.5490179, size.height * 0.3866925);
    path_1.cubicTo(
        size.width * 0.5429815,
        size.height * 0.3866925,
        size.width * 0.5369867,
        size.height * 0.3871501,
        size.width * 0.5310333,
        size.height * 0.3878543);
    path_1.cubicTo(
        size.width * 0.5250799,
        size.height * 0.3871501,
        size.width * 0.5190850,
        size.height * 0.3866925,
        size.width * 0.5130487,
        size.height * 0.3866925);
    path_1.lineTo(size.width * 0.2827960, size.height * 0.3866925);
    path_1.cubicTo(
        size.width * 0.2030787,
        size.height * 0.3866925,
        size.width * 0.1289415,
        size.height * 0.4476677,
        size.width * 0.08183306,
        size.height * 0.5415948);
    path_1.cubicTo(
        size.width * 0.03111523,
        size.height * 0.6426333,
        size.width * 0.006223046,
        size.height * 0.8102447,
        size.width * 0.01603472,
        size.height * 1.000739);
    path_1.cubicTo(
        size.width * 0.02584639,
        size.height * 1.191234,
        size.width * 0.08828429,
        size.height * 1.314064,
        size.width * 0.1982870,
        size.height * 1.314064);
    path_1.lineTo(size.width * 0.8637796, size.height * 1.314064);
    path_1.cubicTo(
        size.width * 0.9737201,
        size.height * 1.314064,
        size.width * 1.036303,
        size.height * 1.191269,
        size.width * 1.046032,
        size.height * 1.000739);
    path_1.cubicTo(
        size.width * 1.055761,
        size.height * 0.8102095,
        size.width * 1.030951,
        size.height * 0.6426333,
        size.width * 0.9802335,
        size.height * 0.5415948);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xffb61c18).withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9802335, size.height * 0.5102623);
    path_2.cubicTo(
        size.width * 0.9331251,
        size.height * 0.4162295,
        size.width * 0.8589878,
        size.height * 0.3553600,
        size.width * 0.7792706,
        size.height * 0.3553600);
    path_2.lineTo(size.width * 0.5490179, size.height * 0.3553600);
    path_2.cubicTo(
        size.width * 0.5429815,
        size.height * 0.3553600,
        size.width * 0.5369867,
        size.height * 0.3558176,
        size.width * 0.5310333,
        size.height * 0.3564865);
    path_2.cubicTo(
        size.width * 0.5250799,
        size.height * 0.3558176,
        size.width * 0.5190850,
        size.height * 0.3553600,
        size.width * 0.5130487,
        size.height * 0.3553600);
    path_2.lineTo(size.width * 0.2827960, size.height * 0.3553600);
    path_2.cubicTo(
        size.width * 0.2030787,
        size.height * 0.3553600,
        size.width * 0.1289415,
        size.height * 0.4163352,
        size.width * 0.08183306,
        size.height * 0.5102623);
    path_2.cubicTo(
        size.width * 0.03111523,
        size.height * 0.6112656,
        size.width * 0.006223046,
        size.height * 0.7788770,
        size.width * 0.01603472,
        size.height * 0.9693716);
    path_2.cubicTo(
        size.width * 0.02584639,
        size.height * 1.159866,
        size.width * 0.08828429,
        size.height * 1.282697,
        size.width * 0.1982870,
        size.height * 1.282697);
    path_2.lineTo(size.width * 0.8637796, size.height * 1.282697);
    path_2.cubicTo(
        size.width * 0.9737201,
        size.height * 1.282697,
        size.width * 1.036303,
        size.height * 1.159937,
        size.width * 1.046032,
        size.height * 0.9693716);
    path_2.cubicTo(
        size.width * 1.055761,
        size.height * 0.7788065,
        size.width * 1.030951,
        size.height * 0.6112656,
        size.width * 0.9802335,
        size.height * 0.5102623);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Color(0xffe30613).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.9802335, size.height * 0.5102623);
    path_3.cubicTo(
        size.width * 0.9331251,
        size.height * 0.4162295,
        size.width * 0.8589878,
        size.height * 0.3553600,
        size.width * 0.7792706,
        size.height * 0.3553600);
    path_3.lineTo(size.width * 0.5490179, size.height * 0.3553600);
    path_3.cubicTo(
        size.width * 0.5429815,
        size.height * 0.3553600,
        size.width * 0.5369867,
        size.height * 0.3558176,
        size.width * 0.5310333,
        size.height * 0.3564865);
    path_3.cubicTo(
        size.width * 0.5250799,
        size.height * 0.3558176,
        size.width * 0.5190850,
        size.height * 0.3553600,
        size.width * 0.5130487,
        size.height * 0.3553600);
    path_3.lineTo(size.width * 0.2827960, size.height * 0.3553600);
    path_3.cubicTo(
        size.width * 0.2030787,
        size.height * 0.3553600,
        size.width * 0.1289415,
        size.height * 0.4163352,
        size.width * 0.08183306,
        size.height * 0.5102623);
    path_3.cubicTo(
        size.width * 0.03111523,
        size.height * 0.6112656,
        size.width * 0.006223046,
        size.height * 0.7788770,
        size.width * 0.01603472,
        size.height * 0.9693716);
    path_3.cubicTo(
        size.width * 0.02584639,
        size.height * 1.159866,
        size.width * 0.08828429,
        size.height * 1.282697,
        size.width * 0.1982870,
        size.height * 1.282697);
    path_3.lineTo(size.width * 0.8637796, size.height * 1.282697);
    path_3.cubicTo(
        size.width * 0.9737201,
        size.height * 1.282697,
        size.width * 1.036303,
        size.height * 1.159937,
        size.width * 1.046032,
        size.height * 0.9693716);
    path_3.cubicTo(
        size.width * 1.055761,
        size.height * 0.7788065,
        size.width * 1.030951,
        size.height * 0.6112656,
        size.width * 0.9802335,
        size.height * 0.5102623);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5310333, size.height * -43.98169),
        Offset(size.width * 0.5310333, size.height * 1.214751), [
      Color(0xffffffff).withOpacity(1),
      Color(0xff575757).withOpacity(1),
      Color(0xff000000).withOpacity(1)
    ], [
      0.63,
      0.87,
      1
    ]);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.9263005, size.height * 0.5597606);
    path_4.cubicTo(
        size.width * 0.8848135,
        size.height * 0.4807956,
        size.width * 0.8196167,
        size.height * 0.4295018,
        size.width * 0.7494622,
        size.height * 0.4295018);
    path_4.lineTo(size.width * 0.5468398, size.height * 0.4295018);
    path_4.cubicTo(
        size.width * 0.5415502,
        size.height * 0.4295018,
        size.width * 0.5362814,
        size.height * 0.4298891,
        size.width * 0.5310333,
        size.height * 0.4304524);
    path_4.cubicTo(
        size.width * 0.5257852,
        size.height * 0.4298891,
        size.width * 0.5205163,
        size.height * 0.4295018,
        size.width * 0.5152060,
        size.height * 0.4295018);
    path_4.lineTo(size.width * 0.3126044, size.height * 0.4295018);
    path_4.cubicTo(
        size.width * 0.2424499,
        size.height * 0.4295018,
        size.width * 0.1772116,
        size.height * 0.4806548,
        size.width * 0.1357661,
        size.height * 0.5597606);
    path_4.cubicTo(
        size.width * 0.09116763,
        size.height * 0.6445344,
        size.width * 0.06938697,
        size.height * 0.7850731,
        size.width * 0.07787105,
        size.height * 0.9451505);
    path_4.cubicTo(
        size.width * 0.08635514,
        size.height * 1.105228,
        size.width * 0.1414291,
        size.height * 1.208132,
        size.width * 0.2382390,
        size.height * 1.208132);
    path_4.lineTo(size.width * 0.8238276, size.height * 1.208132);
    path_4.cubicTo(
        size.width * 0.9206375,
        size.height * 1.208132,
        size.width * 0.9756285,
        size.height * 1.105087,
        size.width * 0.9841955,
        size.height * 0.9451505);
    path_4.cubicTo(
        size.width * 0.9927626,
        size.height * 0.7852139,
        size.width * 0.9708990,
        size.height * 0.6446048,
        size.width * 0.9263005,
        size.height * 0.5597606);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xffe52518).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.9263005, size.height * 0.5597606);
    path_5.cubicTo(
        size.width * 0.8848135,
        size.height * 0.4807956,
        size.width * 0.8196167,
        size.height * 0.4295018,
        size.width * 0.7494622,
        size.height * 0.4295018);
    path_5.lineTo(size.width * 0.5468398, size.height * 0.4295018);
    path_5.cubicTo(
        size.width * 0.5415502,
        size.height * 0.4295018,
        size.width * 0.5362814,
        size.height * 0.4298891,
        size.width * 0.5310333,
        size.height * 0.4304524);
    path_5.cubicTo(
        size.width * 0.5257852,
        size.height * 0.4298891,
        size.width * 0.5205163,
        size.height * 0.4295018,
        size.width * 0.5152060,
        size.height * 0.4295018);
    path_5.lineTo(size.width * 0.3126044, size.height * 0.4295018);
    path_5.cubicTo(
        size.width * 0.2424499,
        size.height * 0.4295018,
        size.width * 0.1772116,
        size.height * 0.4806548,
        size.width * 0.1357661,
        size.height * 0.5597606);
    path_5.cubicTo(
        size.width * 0.09116763,
        size.height * 0.6445344,
        size.width * 0.06938697,
        size.height * 0.7850731,
        size.width * 0.07787105,
        size.height * 0.9451505);
    path_5.cubicTo(
        size.width * 0.08635514,
        size.height * 1.105228,
        size.width * 0.1414291,
        size.height * 1.208132,
        size.width * 0.2382390,
        size.height * 1.208132);
    path_5.lineTo(size.width * 0.8238276, size.height * 1.208132);
    path_5.cubicTo(
        size.width * 0.9206375,
        size.height * 1.208132,
        size.width * 0.9756285,
        size.height * 1.105087,
        size.width * 0.9841955,
        size.height * 0.9451505);
    path_5.cubicTo(
        size.width * 0.9927626,
        size.height * 0.7852139,
        size.width * 0.9708990,
        size.height * 0.6446048,
        size.width * 0.9263005,
        size.height * 0.5597606);
    path_5.close();

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5310333, size.height * 0.4297131),
        Offset(size.width * 0.5310333, size.height * 1.208203), [
      Color(0xffffffff).withOpacity(1),
      Color(0xff575757).withOpacity(1),
      Color(0xff000000).withOpacity(1)
    ], [
      0,
      0.65,
      1
    ]);
    canvas.drawPath(path_5, paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
