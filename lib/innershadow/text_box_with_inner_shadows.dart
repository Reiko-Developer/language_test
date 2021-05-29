import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_box_shadow.dart';

import 'luigi_inner_shadow.dart';

///Doesn't work well on web even with CanvasKit.
class TextBoxWithInnerShadows extends StatelessWidget {
  TextBoxWithInnerShadows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
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
              SizedBox(height: 30),
              Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
