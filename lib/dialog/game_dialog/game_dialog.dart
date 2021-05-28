import 'package:flutter/material.dart';
import 'package:language_test/dialog/box_dialog.dart';
import 'package:language_test/dialog/title_dialog.dart';

class GameDialog extends StatelessWidget {
  const GameDialog();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, cc) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: cc.maxHeight * 0.2,
            width: cc.maxWidth,
            height: cc.maxHeight * 0.8,
            child: BoxDialog(),
          ),
          Positioned(
            top: 0,
            width: cc.maxWidth * 0.6,
            height: cc.maxHeight * 0.4,
            child: TitleDialog(
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
