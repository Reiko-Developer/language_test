import 'package:flutter/material.dart';

class InnerShadowRectangle extends StatefulWidget {
  @override
  _NeumorphicRectangleState createState() => _NeumorphicRectangleState();
}

class _NeumorphicRectangleState extends State<InnerShadowRectangle> {
  final rectangleSize = Size(260, 200);
  final unit = 20.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: rectangleSize.width,
          height: rectangleSize.height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius:
                BorderRadius.circular(rectangleSize.shortestSide * 0.1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(-unit / 2, -unit / 2),
                blurRadius: 1.5 * unit,
              ),
              BoxShadow(
                color: Colors.grey.shade600,
                offset: Offset(unit / 2, unit / 2),
                blurRadius: 1.5 * unit,
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              width: rectangleSize.width * 0.8,
              height: rectangleSize.height * 0.85,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(rectangleSize.shortestSide * 0.1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -12,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Center(child: Text('Text kasd')),
              ),
            ),
          )),
    );
  }
}
