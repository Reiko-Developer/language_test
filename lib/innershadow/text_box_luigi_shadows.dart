import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextBoxLuigiShadows extends SingleChildRenderObjectWidget {
  TextBoxLuigiShadows({
    Key? key,
    required this.color,
    required this.blur,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;
  final double blur;

  @override
  RenderInnerShadow createRenderObject(BuildContext context) {
    return RenderInnerShadow(color, blur);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  RenderInnerShadow(
    this._color,
    this._blur, {
    RenderBox? child,
  }) : super(child);

  Color _color;
  double _blur;

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

  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    drawShadow(context, offset);
  }

  void drawShadow(PaintingContext context, Offset offset) {
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
      ..colorFilter = const ColorFilter.matrix(
        [
          1, 0, 0, 0, 0, //
          0, 1, 0, 0, 0, //
          0, 0, 1, 0, 0, //
          0, 0, 0, -1, 255, //
        ],
      );

    ///This layer will erase the shadow layer.
    context.canvas.saveLayer(offset & size, invertPaint);
    context.canvas.scale(0.9);
    context.canvas.translate(size.width * 0.05, size.height * 0.05);

    //This paints the child on top of the canvas and mix it with the shadows layer.
    context.paintChild(child!, offset);

    context.canvas.restore();
    context.canvas.restore();
    context.canvas.restore();
  }

  bool shouldRepaint(TextBoxLuigiShadows old) {
    return true;
  }
}
