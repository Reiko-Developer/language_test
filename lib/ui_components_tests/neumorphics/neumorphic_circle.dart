import 'package:flutter/material.dart';

class NeumorphicCircle extends StatefulWidget {
  @override
  _NeumorphicCircleState createState() => _NeumorphicCircleState();
}

class _NeumorphicCircleState extends State<NeumorphicCircle> {
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
              child:
                  //InnerShadows
                  Center(
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
