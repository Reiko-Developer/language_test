import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextBoxLuigiShadows extends SingleChildRenderObjectWidget {
  TextBoxLuigiShadows({
    Key? key,
    required this.color,
    required this.blur,
    required this.offset,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;
  final double blur;
  final Offset offset;

  @override
  RenderInnerShadow createRenderObject(BuildContext context) {
    return RenderInnerShadow(color, blur, offset);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..offset = offset;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  RenderInnerShadow(
    this._color,
    this._blur,
    this._offset, {
    RenderBox? child,
  }) : super(child);

  Color _color;
  double _blur;
  Offset _offset;

  @override
  bool get alwaysNeedsCompositing => child != null;

  Color get color => _color;
  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  double get blur => _blur;
  set blur(double value) {
    if (_blur == value) return;
    _blur = value;
    markNeedsPaint();
  }

  Offset get offset => _offset;
  set offset(Offset value) {
    if (_offset == value) return;
    _offset = value;
    markNeedsPaint();
  }

  final externalRadius = Radius.circular(20);
  final innerRectRadius = Radius.circular(15);

  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    //Luigi's code
    var layerPaint = Paint()..color = Colors.white;

    context.canvas.saveLayer(offset & size, layerPaint);
    context.paintChild(child!, offset);

    //first shadow
    var shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcIn);

    context.canvas.saveLayer(offset & size, shadowPaint);

    // Invert the alpha to compute inner part.
    var invertPaint = Paint()
      ..colorFilter = const ColorFilter.matrix([
        1, 0, 0, 0, 0, //
        0, 1, 0, 0, 0, //
        0, 0, 1, 0, 0, //
        0, 0, 0, -1, 255, //
      ]);
    context.canvas.saveLayer(offset & size, invertPaint);
    context.canvas.translate(_offset.dy, _offset.dx);
    context.paintChild(child!, offset);

    //Second shadow
    // context.canvas.saveLayer(offset & size, invertPaint);
    // context.canvas.translate(_offset.dy, _offset.dx);
    // context.paintChild(child!, offset);

    //
    context.canvas.restore();
    context.canvas.restore();
    context.canvas.restore();
    context.canvas.restore();

    //end luigi's code
    final paintingSpace = offset & size;

    // final paint = Paint();
    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(rect, externalRadius),
    //   paint
    //     ..color = const Color(0xffEB6109)
    //     ..shader = null,
    // );

    // canvas.saveLayer(rect, paint..blendMode = BlendMode.softLight);

    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(rect, externalRadius),
    //   paint
    //     ..shader = LinearGradient(
    //       colors: [
    //         const Color(0xff000000),
    //         const Color(0xffffffff),
    //       ],
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //     ).createShader(rect),
    // );

    // canvas.restore();

    final double sideBordersWidth = paintingSpace.shortestSide * 0.2;
    final double topBotBordersWidth = sideBordersWidth * 0.4;

    final innerRect = Rect.fromLTWH(
      paintingSpace.left + sideBordersWidth,
      paintingSpace.top + topBotBordersWidth,
      paintingSpace.width - 2 * sideBordersWidth,
      paintingSpace.height - 2 * topBotBordersWidth,
    );

    var moreOpaqueInnerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        innerRect.left + sideBordersWidth,
        innerRect.top + topBotBordersWidth,
        innerRect.width - 2 * sideBordersWidth,
        innerRect.height - topBotBordersWidth,
      ),
      Radius.circular(10),
    );

    //TODO: apply Luigi's innerShadow
    context.canvas.drawDRRect(
      RRect.fromRectAndRadius(innerRect, innerRectRadius),
      moreOpaqueInnerRect,
      Paint()
        ..color = Colors.black
        ..maskFilter = MaskFilter.blur(
          BlurStyle.inner,
          convertRadiusToSigma(20),
        ),
    );
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  bool shouldRepaint(TextBoxLuigiShadows old) {
    return true;
  }
}
