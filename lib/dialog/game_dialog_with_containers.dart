import 'package:flutter/material.dart';
import 'package:language_test/dialog/red_corners_widget.dart';

class GameDialogWithContainers extends StatelessWidget {
  const GameDialogWithContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width * 0.9,
            height: size.height * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xFFF8BC24),
              borderRadius: BorderRadius.circular(size.width * 0.1),
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.overlay,
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFeaeaea),
                      const Color(0xFFd1d1d1),
                      const Color(0xFFaeaeae),
                      const Color(0xFF818181),
                      const Color(0xFF494949),
                      const Color(0xFF494949),
                      const Color(0xFF090909),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.0,
                      0.01,
                      0.02,
                      0.07,
                      0.55,
                      0.85,
                      0.93,
                      1,
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.9 - size.width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFF8BC24).withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3)),
                        BoxShadow(
                          color: const Color(0xFFF8BC24),
                          spreadRadius: -10,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          RedCornerWidget(
            Size(size.width * 0.9, size.height * 0.9),
            size.width * 0.05,
            Colors.green,
          ),
        ],
      ),
    );
  }
}
