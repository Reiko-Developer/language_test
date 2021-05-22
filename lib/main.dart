import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_test/neumorphic_circle.dart';
import 'package:language_test/inner_shadow_rectangle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: InnerShadowRectangle(),
        ),
      ),
    );
  }
}

class UnderstandingColors extends StatelessWidget {
  const UnderstandingColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFF8BC24),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.overlay,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFfafafa),
                      const Color(0xFFeaeaea),
                      const Color(0xFFd1d1d1),
                      const Color(0xFFaeaeae),
                      const Color(0xFF818181),
                      const Color(0xFF494949),
                      const Color(0xFF090909),
                      const Color(0xFF000000)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.0,
                      0.11,
                      0.27,
                      0.42,
                      0.55,
                      0.7,
                      0.8,
                      0.93,
                      1,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
