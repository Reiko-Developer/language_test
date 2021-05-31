import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Addapetd initially from Luigi Rosso
//https://github.com/luigi-rosso/flutter-inner-shadow/blob/master/lib/inner_shadow.dart

class InnerShadows extends SingleChildRenderObjectWidget {
  InnerShadows({
    Key? key,
    this.color = const Color(0xFF000000),
    this.blur = 10,
    this.shadowHeight = 0.1,
    this.shadowWidth = 0.1,
    required Widget child,
  }) : super(key: key, child: child);

  ///Defaults to full opaque black.
  final Color color;

  ///Defaults to a blur of 10.
  final double blur;

  ///From 0 to 1, how much width space of the passed child will be shadowed.
  ///
  final double shadowWidth;

  ///From 0 to 1, how much height space of the passed child will be shadowed.
  final double shadowHeight;

  @override
  RenderInnerShadow createRenderObject(BuildContext context) {
    return RenderInnerShadow(color, blur, shadowWidth, shadowHeight);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..shadowWidth = shadowWidth
      ..shadowHeight = shadowHeight;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  RenderInnerShadow(
    this._color,
    this._blur,
    this._shadowWidth,
    this._shadowHeight, {
    RenderBox? child,
  }) : super(child);

  Color _color;
  double _blur;
  double _shadowWidth;
  double _shadowHeight;

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

  double get shadowWidth => _shadowWidth;

  set shadowWidth(double val) {
    if (_shadowWidth == val) return;

    _shadowWidth = val;
    markNeedsPaint();
  }

  double get shadowHeight => _shadowHeight;

  set shadowHeight(double val) {
    if (_shadowHeight == val) return;

    _shadowHeight = val;
    markNeedsPaint();
  }

  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    drawShadow(context, offset);
  }

  void drawShadow(PaintingContext context, Offset offset) {
    if (shadowHeight == 0 && shadowWidth == 0) {
      context.paintChild(child!, offset);
      return;
    }

    final layerPaint = Paint()..color = Colors.white;

    context.canvas.saveLayer(offset & size, layerPaint);
    context.paintChild(child!, offset);

    //Shadow
    final shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcIn);

    context.canvas.saveLayer(offset & size, shadowPaint);

    //Invert the alpha to compute inner part.
    final invertPaint = Paint()
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

    //This value centers the layer on the X axis.
    final xtranslationValue =
        (size.width / 2) * _shadowWidth + offset.dx * _shadowWidth;

    //This value centers the layer on the Y axis.
    final yTranslationValue =
        (size.height / 2) * _shadowHeight + offset.dy * _shadowHeight;

    final matrix = Matrix4.identity()
      ..translate(
        xtranslationValue,
        yTranslationValue,
      )
      ..scale(1 - _shadowWidth, 1 - _shadowHeight);

    context.canvas.transform(matrix.storage);

    //This paints the child on top of the canvas and mix it with the shadows layer.
    context.paintChild(child!, offset);

    context.canvas.restore();
    context.canvas.restore();
    context.canvas.restore();
  }

  @override
  void visitChildrenForSemantics(RenderObjectVisitor visitor) {
    if (child != null) visitor(child!);
  }
}
