import 'package:flutter/material.dart';

class Brasil extends CustomPainter {
  const Brasil();
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff27273d).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xff04a558).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5771484, size.height * 0.9941406);
    path_2.arcToPoint(Offset(size.width * 0.5000000, size.height),
        radius:
            Radius.elliptical(size.width * 0.5025195, size.height * 0.5025195),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.cubicTo(size.width * 0.2238672, size.height, 0,
        size.height * 0.7761523, 0, size.height * 0.5000000);
    path_2.cubicTo(0, size.height * 0.2238477, size.width * 0.2238672, 0,
        size.width * 0.5000000, 0);
    path_2.arcToPoint(Offset(size.width * 0.5771484, size.height * 0.005859375),
        radius:
            Radius.elliptical(size.width * 0.5025195, size.height * 0.5025195),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.cubicTo(
        size.width * 0.3614258,
        size.height * 0.03933594,
        size.width * 0.1912500,
        size.height * 0.2106641,
        size.width * 0.1595898,
        size.height * 0.4269727);
    path_2.arcToPoint(Offset(size.width * 0.1595898, size.height * 0.5730273),
        radius:
            Radius.elliptical(size.width * 0.5064258, size.height * 0.5064258),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_2.cubicTo(
        size.width * 0.1912500,
        size.height * 0.7893555,
        size.width * 0.3614258,
        size.height * 0.9606836,
        size.width * 0.5771484,
        size.height * 0.9941406);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Color(0xff03914a).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.5000000, size.height * 0.2294922);
    path_3.lineTo(size.width * 0.03371094, size.height * 0.5000000);
    path_3.lineTo(size.width * 0.5000000, size.height * 0.7705078);
    path_3.lineTo(size.width * 0.9662891, size.height * 0.5000000);
    path_3.close();

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = Color(0xfffcc13d).withOpacity(1.0);
    canvas.drawPath(path_3, paint3Fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.1542969, size.height * 0.5000000);
    path_4.arcToPoint(Offset(size.width * 0.1595898, size.height * 0.5730273),
        radius:
            Radius.elliptical(size.width * 0.5058594, size.height * 0.5058594),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_4.lineTo(size.width * 0.03371094, size.height * 0.5000000);
    path_4.lineTo(size.width * 0.1595898, size.height * 0.4269727);
    path_4.arcToPoint(Offset(size.width * 0.1542969, size.height * 0.5000000),
        radius:
            Radius.elliptical(size.width * 0.5058594, size.height * 0.5058594),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_4.close();

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = Color(0xffdda22c).withOpacity(1.0);
    canvas.drawPath(path_4, paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = Color(0xff00b564).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8834180, size.height * 0.2734570),
        size.width * 0.03179688, paint5Fill);

    Paint paint6Fill = Paint()..style = PaintingStyle.fill;
    paint6Fill.color = Color(0xff00b564).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8399805, size.height * 0.2234570),
        size.width * 0.02251953, paint6Fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.6933594, size.height * 0.5000000);
    path_7.lineTo(size.width * 0.6933594, size.height * 0.5014453);
    path_7.arcToPoint(Offset(size.width * 0.6933594, size.height * 0.5000000),
        radius:
            Radius.elliptical(size.width * 0.1914063, size.height * 0.1914063),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_7.close();

    Paint paint7Fill = Paint()..style = PaintingStyle.fill;
    paint7Fill.color = Color(0xff3e436d).withOpacity(1.0);
    canvas.drawPath(path_7, paint7Fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.6933594, size.height * 0.5014453);
    path_8.arcToPoint(Offset(size.width * 0.6795898, size.height * 0.5717578),
        radius:
            Radius.elliptical(size.width * 0.1923242, size.height * 0.1923242),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_8.cubicTo(
        size.width * 0.6411719,
        size.height * 0.5023828,
        size.width * 0.5778906,
        size.height * 0.4527734,
        size.width * 0.4906445,
        size.height * 0.4238086);
    path_8.cubicTo(
        size.width * 0.4243750,
        size.height * 0.4018359,
        size.width * 0.3623828,
        size.height * 0.3984180,
        size.width * 0.3355664,
        size.height * 0.3982227);
    path_8.arcToPoint(Offset(size.width * 0.3785352, size.height * 0.3495117),
        radius:
            Radius.elliptical(size.width * 0.1933594, size.height * 0.1933594),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_8.arcToPoint(Offset(size.width * 0.5050195, size.height * 0.3750977),
        radius:
            Radius.elliptical(size.width * 0.5726172, size.height * 0.5726172),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_8.cubicTo(
        size.width * 0.5846289,
        size.height * 0.4012695,
        size.width * 0.6481250,
        size.height * 0.4440820,
        size.width * 0.6933594,
        size.height * 0.5014453);
    path_8.close();

    Paint paint8Fill = Paint()..style = PaintingStyle.fill;
    paint8Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_8, paint8Fill);

    Paint paint9Fill = Paint()..style = PaintingStyle.fill;
    paint9Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3671875, size.height * 0.5605469),
        size.width * 0.01367188, paint9Fill);

    Paint paint10Fill = Paint()..style = PaintingStyle.fill;
    paint10Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.4316406, size.height * 0.6406250),
        size.width * 0.01367188, paint10Fill);

    Paint paint11Fill = Paint()..style = PaintingStyle.fill;
    paint11Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.6048242),
        size.width * 0.01367188, paint11Fill);

    Paint paint12Fill = Paint()..style = PaintingStyle.fill;
    paint12Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5273438, size.height * 0.6542969),
        size.width * 0.01367188, paint12Fill);

    Paint paint13Fill = Paint()..style = PaintingStyle.fill;
    paint13Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.6210938, size.height * 0.5852930),
        size.width * 0.01367188, paint13Fill);

    Paint paint14Fill = Paint()..style = PaintingStyle.fill;
    paint14Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5839844, size.height * 0.6295703),
        size.width * 0.01367188, paint14Fill);

    Paint paint15Fill = Paint()..style = PaintingStyle.fill;
    paint15Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5273438, size.height * 0.5000000),
        size.width * 0.01367188, paint15Fill);

    Paint paint16Fill = Paint()..style = PaintingStyle.fill;
    paint16Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3671875, size.height * 0.4492188),
        size.width * 0.01367188, paint16Fill);

    Paint paint17Fill = Paint()..style = PaintingStyle.fill;
    paint17Fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.4316406, size.height * 0.5742188),
        size.width * 0.01367188, paint17Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
