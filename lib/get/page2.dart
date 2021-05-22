import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_test/controllers/controller.dart';
import 'package:language_test/get/viewModel.dart';

class Page2 extends StatelessWidget {
  static final routeName = '/pg2';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.deepPurple,
            child: Center(
              child: GestureDetector(
                onTap: () => Get.find<Controller>().savePlayer('Josinaldo'),
                child: Container(
                  color: Colors.white54,
                  child: Obx(() => Text(ViewModel.i.getPlayer.value.name)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
