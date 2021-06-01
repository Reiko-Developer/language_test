import 'package:flutter/material.dart';
import 'package:language_test/dialog/game_dialog/end_game_dialog.dart';

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
          color: Colors.white,
          child: Test(),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height * .9,
        width: size.width * .9,
        child: Center(
          child: AspectRatio(
            aspectRatio: 0.63,
            child: Center(
              child: const EndGameDialog(),
            ),
          ),
        ),
      ),
    );
  }
}
