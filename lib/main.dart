import 'package:flutter/material.dart';

import 'package:language_test/dialog/BoxDialog.dart';

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
          child: Center(
            child: Container(
              width: 340,
              height: 450,
              child: BoxDialog(),
            ),
          ),
        ),
      ),
    );
  }
}
