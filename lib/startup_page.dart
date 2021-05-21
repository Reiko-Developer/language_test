import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_test/controllers/controller.dart';
import 'package:language_test/page2.dart';
import 'package:language_test/viewModel.dart';

class StartUpPage extends StatelessWidget {
  onChange(bool isWaiting) {
    print('Is waiting $isWaiting');
  }

  @override
  build(BuildContext context) {
    final controller = Get.put(Controller(), permanent: true);
    Get.put(controller.model, permanent: true);
    Get.put(controller.model.audioModel);
    Get.put(controller.model.getPlayer.value);
    int i = 0;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Name Obx: ${ViewModel.i.getPlayer.value.name}')),

            GetBuilder<PlayerModel>(builder: (_) => Text('Name GB: ${_.name}')),

            GetBuilder<AudioModel>(
              builder: (_) {
                return Text('Waiting? ${_.isWaiting}');
              },
            ),

            Obx(() => Text('URL: ${ViewModel.i.audioModel.getUrl.value}')),

            SizedBox(height: 20),

            GetBuilder<AudioModel>(
              builder: (_) {
                return Text('$i: wait is ' + (_.isWaiting ? 'true' : 'false'));
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Get.find<Controller>().savePlayer('José ${++i}'),
              child: Text('Save newPlayer'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Get.find<Controller>()
                  .changeFailure(i == 3 ? 'ok' : 'Failure ${++i}'),
              child: Text('Change failure'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.find<Controller>().changeName('LKZ'),
              child: Text('LKZ Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.find<Controller>().changeURL('url ${++i}'),
              child: Text('Change URL'),
            ),

            SizedBox(height: 20),

            //Wait e notwait
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Get.find<Controller>().isWaitingAudio(),
                  child: Text('Wait'),
                ),
                ElevatedButton(
                  onPressed: () => Get.find<Controller>().isNotWaitingAudio(),
                  child: Text('Not Wait'),
                ),
              ],
            ),
            SizedBox(height: 20),

            //Go to other page
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
