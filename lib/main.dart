import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_test/controllers/controller.dart';
import 'package:language_test/page2.dart';
import 'package:language_test/startup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), permanent: true);
    Get.put(controller.model, permanent: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartUpPage(),
      routes: {
        Page2.routeName: (_) => Page2(),
      },
    );
  }
}
