import 'package:flutter/material.dart';

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
          // color: Colors.grey[500],
          child: Neumorphic(),
        ),
      ),
    );
  }
}

class Neumorphic extends StatefulWidget {
  @override
  _NeumorphicState createState() => _NeumorphicState();
}

class _NeumorphicState extends State<Neumorphic> {
  final Color dividerColor = const Color(0xFFBDBDBD);
  final backgroundColor = Colors.grey[300];

  //any number, appears to not change nothing on the ui.
  double unit = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          //OuterShadows
          Container(
            width: 300,
            height: 300,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    //darkmode
                    // color: Colors.white.withOpacity(0.2),
                    color: Colors.white,
                    offset: Offset(-unit / 2, -unit / 2),
                    blurRadius: 1.5 * unit,
                  ),
                  BoxShadow(
                    color: dividerColor,
                    offset: Offset(unit / 2, unit / 2),
                    blurRadius: 1.5 * unit,
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: 280,
                  height: 280,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: backgroundColor,
                          gradient: RadialGradient(
                            colors: [
                              // darkMode
                              // backgroundColor.withOpacity(0.0)
                              Colors.white.withOpacity(0.0),
                              dividerColor,
                            ],
                            center: AlignmentDirectional(0.1, 0.1),
                            focal: AlignmentDirectional(0.0, 0.0),
                            radius: 0.65,
                            focalRadius: 0.001,
                            stops: [0.3, 1.0],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: backgroundColor,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.0),
                              //darkMode:
                              //Colors.white.withOpacity(0.3)
                              Colors.white,
                            ],
                            center: AlignmentDirectional(-0.1, -0.1),
                            focal: AlignmentDirectional(0.0, 0.0),
                            radius: 0.67,
                            focalRadius: 0.001,
                            stops: [0.75, 1.0],
                          ),
                        ),
                      ),
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

class OuterShadow extends StatefulWidget {
  @override
  _OuterShadowState createState() => _OuterShadowState();
}

class _OuterShadowState extends State<OuterShadow> {
  final canvasColor = Colors.grey[500];
  final Color dividerColor = const Color(0xFFBDBDBD);
  final backgroundColor = Colors.grey[300];

  //any number, appears to not change nothing on the ui.
  double unit = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  //darkmode
                  // color: Colors.white.withOpacity(0.2),
                  color: Colors.white,
                  offset: Offset(-unit / 2, -unit / 2),
                  blurRadius: 1.5 * unit,
                ),
                BoxShadow(
                  color: dividerColor,
                  offset: Offset(unit / 2, unit / 2),
                  blurRadius: 1.5 * unit,
                ),
              ],
            ),
          ),
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
