import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_test/dialog/dialog_background.dart';
import 'package:language_test/dialog/dialog_box_text.dart';
import 'package:language_test/dialog/dialog_button.dart';
import 'package:language_test/dialog/title_dialog.dart';

class EndGameDialog extends StatelessWidget {
  const EndGameDialog();

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
              child: DialogBackground(
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
                    flex: 6,
                    child: const ThreeStars(),
                  ),
                  Expanded(
                    flex: 4,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: DialogBoxText(
                        title: 'YOUR SCORE',
                        text: '5590124',
                      ),
                    ),
                  ),

                  //Coins & Gems Row
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        SizedBox(width: bc.maxWidth * 0.1),
                        Expanded(
                          child: const DialogBoxText(
                            title: 'Coins',
                            text: '99124',
                          ),
                        ),
                        SizedBox(width: bc.maxWidth * 0.04),
                        Expanded(
                          child: const DialogBoxText(
                            title: 'Gems',
                            text: '1',
                          ),
                        ),
                        SizedBox(width: bc.maxWidth * 0.1),
                      ],
                    ),
                  ),
                  SizedBox(height: bc.maxHeight * .005),
                  Expanded(
                    flex: 3,
                    child: FractionallySizedBox(
                      widthFactor: 0.42,
                      heightFactor: 0.8,
                      child: DialogButton(
                        text: 'NEXT',
                        shadowBlurRadius: 3,
                        shadowColor: const Color(0xFF000000),
                        maskColor: const Color(0xFFE41032),
                        mainShapeColor: const Color(0xFF990415),
                        onTap: () {
                          print('Next');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: FractionallySizedBox(
                      heightFactor: 0.8,
                      child: Row(
                        children: [
                          SizedBox(width: bc.maxWidth * .03),
                          Expanded(
                            child: DialogButton(
                              text: ' HOME ',
                              shadowBlurRadius: 3,
                              shadowColor: Colors.black.withOpacity(1),
                              onTap: () {
                                print('home');
                              },
                            ),
                          ),
                          SizedBox(width: bc.maxWidth * .03),
                          Expanded(
                            child: DialogButton(
                              text: 'REPLAY',
                              shadowBlurRadius: 3,
                              shadowColor: Colors.black.withOpacity(1),
                              onTap: () {
                                print('replay');
                              },
                            ),
                          ),
                          SizedBox(width: bc.maxWidth * .03),
                        ],
                      ),
                    ),
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

class ThreeStars extends StatelessWidget {
  const ThreeStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, bc) {
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
              child: SvgPicture.asset('assets/icons/blue-star.svg'),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: starWidth,
              height: bc.maxHeight,
              child: SvgPicture.asset('assets/icons/blue-star.svg'),
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
              child: SvgPicture.asset('assets/icons/blue-star.svg'),
            ),
          ),
        ],
      );
    });
  }
}
