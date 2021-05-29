import 'package:flutter/material.dart';

import 'luigi_inner_shadow.dart';

///Doesn't work well on web even with CanvasKit.
class BoxTextField extends StatelessWidget {
  BoxTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Container(
          height: 400,
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
      ),
    );
  }
}
