import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_box_shadow.dart';
import 'package:language_test/innershadow/custom_text_box.dart';
import 'package:language_test/innershadow/text_box_luigi_shadows.dart';

import 'luigi_inner_shadow.dart';

///Doesn't work well on web even with CanvasKit.
class TextBoxesTest extends StatelessWidget {
  TextBoxesTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              SizedBox(
                height: 75,
                width: 340,
                child: TextBoxLuigiShadows(
                  blur: 10,
                  color: Colors.black,
                  offset: Offset(10, 0),
                  child: Center(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.95)),
                    BoxShadow(
                        color: Colors.blue, blurRadius: 5, spreadRadius: -2)
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  backgroundBlendMode: BlendMode.multiply,
                  color: const Color(0xffEB6109).withAlpha(200),
                  boxShadow: [
                    CustomBoxShadow(color: Colors.black.withOpacity(0.9)),
                    CustomBoxShadow(
                      color: Colors.white,
                      blurRadius: 17,
                      spreadRadius: -2,
                      blurStyle: BlurStyle.inner,
                    ),
                    CustomBoxShadow(
                      color: Colors.white,
                      blurRadius: 3,
                      spreadRadius: -10,
                      offset: Offset(0, 14),
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 250,
                width: 250,
                child: LuigiInnerShadow(
                  color: Colors.black.withAlpha(200),
                  offset: Offset(5, -5),
                  blur: 10,
                  child: LuigiInnerShadow(
                    color: Colors.black.withAlpha(200),
                    offset: Offset(-5, 5),
                    blur: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    CustomBoxShadow(color: Colors.black.withOpacity(0.95)),
                    CustomBoxShadow(
                      color: Colors.blue,
                      blurRadius: 25,
                      spreadRadius: -1,
                      blurStyle: BlurStyle.inner,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 75,
                width: 340,
                child: CustomPaint(
                  painter: CustomTextBox(),
                  child: Center(
                    child: Text(
                      'TEXTO',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.white.withOpacity(1)),
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: -20,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
