import 'package:get/get.dart';

class ViewModel extends GetxController {
  static ViewModel get i => Get.find();

  final _player = PlayerModel('', '').obs;

  AudioModel audioModel = AudioModel();

  Rx<PlayerModel> get getPlayer => _player;

  set setPlayer(PlayerModel playerModel) {
    _player.update((value) {
      value!.id = playerModel.id;
      value.name = playerModel.name;
    });
  }
}

class PlayerModel extends GetxController {
  String _id = '';
  String _name = '';

  PlayerModel(this._id, this._name);

  String get id => _id;
  String get name => _name;

  set id(String id) {
    _id = id;
    update();
  }

  set name(String name) {
    _name = name;
    update();
  }
}

class AudioModel extends GetxController {
  static AudioModel get i => Get.find();

  bool _isWaiting = true;
  final _url = 'url'.obs;
  final _failure = 'initialValue'.obs;

  onInit() {
    super.onInit();
    late Worker worker;
    worker = ever(_failure, (String _) {
      print('Failure changed to:$_');

      if (_failure.value == 'ok') {
        print('Disposing worker.');
        worker.dispose();
      }
    }, condition: _failure.value.isNotEmpty);
  }

  String get failure => _failure.value;

  set failure(String failure) {
    _failure.value = failure;
    update();
  }

  bool get isWaiting => _isWaiting;

  set isWaiting(bool isWaiting) {
    _isWaiting = isWaiting;
    update();
  }

  RxString get getUrl => _url;

  set url(String url) {
    _url.value = url;
    update();
  }
}
