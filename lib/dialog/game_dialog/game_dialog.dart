import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_test/dialog/box_dialog.dart';
import 'package:language_test/dialog/svgs-backups/button_svg.dart';
import 'package:language_test/dialog/title_dialog.dart';
import 'package:language_test/innershadow/custom_text_box.dart';
import 'package:language_test/innershadow/inner_shadows.dart';

class GameDialog extends StatelessWidget {
  const GameDialog();

  ///The correct ratio for the title custom Painter size.
  final double _widthRatio = 0.585981098109811;

  final double dialogBoxBorderWidth = 20, dialogBoxShadowWidth = 5;

  Size getTitleSize(double maxWidth, double maxHeight) {
    double width = maxWidth;
    double height = maxWidth * _widthRatio;

    if (height > maxHeight) {
      height = maxHeight;
      width = height / _widthRatio;
    }

    return Size(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, bc) {
        final titleSize = getTitleSize(bc.maxWidth * 0.6, bc.maxHeight * 0.3);

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: titleSize.height * 0.6,
              width: bc.maxWidth,
              height: bc.maxHeight - titleSize.height * 0.6,
              child: BoxDialog(
                borderWidth: dialogBoxBorderWidth,
                shadowWidth: dialogBoxShadowWidth,
              ),
            ),
            Positioned(
              top: 0,
              width: titleSize.width,
              height: titleSize.height,
              child: TitleDialog(),
            ),
            Positioned(
              top: titleSize.height,
              height: bc.maxHeight -
                  (titleSize.height +
                      dialogBoxBorderWidth +
                      dialogBoxShadowWidth),
              width: bc.maxWidth -
                  2 * (dialogBoxBorderWidth + dialogBoxShadowWidth),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: LayoutBuilder(builder: (c, bc) {
                      final double starWidth = 0.3 * bc.maxWidth;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.identity()
                              ..scale(0.9)
                              ..rotateZ(-0.2),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: starWidth,
                              height: bc.maxHeight,
                              child: SvgPicture.asset(
                                  'assets/icons/blue-star.svg'),
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: starWidth,
                              height: bc.maxHeight,
                              child: SvgPicture.asset(
                                  'assets/icons/blue-star.svg'),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.identity()
                              ..scale(0.9)
                              ..rotateZ(0.2),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: starWidth,
                              height: bc.maxHeight,
                              child: SvgPicture.asset(
                                  'assets/icons/blue-star.svg'),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Expanded(
                    flex: 2,
                    child: DialogBoxText(
                      title: 'YOUR SCORE',
                      text: '5590124',
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: const DialogBoxText(
                            title: 'Coins',
                            text: '99124',
                          ),
                        ),
                        SizedBox(width: bc.maxWidth * 0.015),
                        Expanded(
                          child: const DialogBoxText(
                            title: 'Gems',
                            text: '1',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomPaint(
                    size: Size(300, 300 * .3088),
                    painter: ButtonSVG(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.purple),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DialogBoxText extends StatelessWidget {
  const DialogBoxText({
    required this.title,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF9B1313),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Expanded(
          child: Stack(
            children: [
              CustomPaint(
                size: Size.infinite,
                painter: CustomTextBox(),
              ),
              SizedBox.fromSize(
                size: Size.infinite,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
