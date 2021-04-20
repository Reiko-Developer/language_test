import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_test/controllers/controller.dart';
import 'package:language_test/page2.dart';
import 'package:language_test/viewModel.dart';

class StartUpPage extends StatelessWidget {
  @override
  build(BuildContext context) {
    int i = 0;
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ViewModel>(
              builder: (_) => Text('Name: ${_.playerModel.name}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                i++;
                Get.find<Controller>().savePlayer('José $i');
              },
              child: Text('Save newPlayer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                i++;
                Get.find<Controller>().changeName('Novo nome $i');
              },
              child: Text('New name only'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Page2.routeName),
              child: Text('page2'),
            )
          ],
        ),
      ),
    );
  }
}
