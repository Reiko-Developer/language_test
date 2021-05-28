import 'package:flutter/material.dart';

import 'inner_shadow.dart';

class InnerShadowTest extends StatefulWidget {
  InnerShadowTest({Key? key}) : super(key: key);

  @override
  _InnerShadowTestState createState() => _InnerShadowTestState();
}

class _InnerShadowTestState extends State<InnerShadowTest> {
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
              child: InnerShadow(
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
