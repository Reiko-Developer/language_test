import 'package:flutter/material.dart';
import 'package:language_test/dialog/custom_box_shadow.dart';
import 'package:language_test/innershadow/box_text_field.dart';

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
          child: BoxTextField(),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // return Center(
    //   child: Container(
    //     width: size.width * 0.85,
    //     height: size.height * 0.85,
    //     child: const GameDialog(),
    //   ),
    // );

    return Center(
      child: SizedBox(
        width: size.width * 0.4,
        height: size.width * 0.05,
        child: CustomTextBox('Text goes here'),
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  const CustomTextBox(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      decoration: BoxDecoration(
        boxShadow: [
          CustomBoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 30,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
    );
  }
}
