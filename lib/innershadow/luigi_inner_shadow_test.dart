import 'package:flutter/material.dart';

import 'luigi_inner_shadow.dart';

class LuigiInnerShadowTest extends StatefulWidget {
  LuigiInnerShadowTest({Key? key}) : super(key: key);

  @override
  _LuigiInnerShadowTestState createState() => _LuigiInnerShadowTestState();
}

class _LuigiInnerShadowTestState extends State<LuigiInnerShadowTest> {
  double blur = 10;
  double offsetX = 10;
  double offsetY = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: LuigiInnerShadow(
                color: Colors.black,
                offset: Offset(offsetX, offsetY),
                blur: blur,
                child: Image.asset("assets/splat.png"),
              ),
            ),
            Text("Blur ${blur.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: blur,
                onChanged: (newValue) {
                  setState(() {
                    blur = newValue;
                  });
                },
              ),
            ),
            Text("Offset X ${offsetX.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: offsetX,
                onChanged: (newValue) {
                  setState(() {
                    offsetX = newValue;
                  });
                },
              ),
            ),
            Text("Offse Y ${offsetY.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: offsetY,
                onChanged: (newValue) {
                  setState(() {
                    offsetY = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
