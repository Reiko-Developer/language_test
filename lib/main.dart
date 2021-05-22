import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_game_dialog.dart';
import 'package:language_test/dialog/dialog_with_multiple_containers.dart';
import 'package:language_test/dialog/red_corners_widget.dart';

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
          color: Colors.black,
          child: CustomGameDialog(),
        ),
      ),
    );
  }
}
