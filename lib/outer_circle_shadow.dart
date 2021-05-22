import 'package:flutter/material.dart';

class OuterCircleShadow extends StatefulWidget {
  @override
  _OuterCircleShadowState createState() => _OuterCircleShadowState();
}

class _OuterCircleShadowState extends State<OuterCircleShadow> {
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
