import 'package:flutter/material.dart';
import 'package:language_test/dialog/title_dialog.dart';

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
          // color: Colors.black,
          child: Center(
            child: TitleDialog(
              child: Container(
                  // color: Colors.green.withAlpha(90),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
