import 'package:get/get.dart';

class ViewModel extends GetxController {
  PlayerModel _playerModel = PlayerModel();

  bool waiting = false;

  PlayerModel get playerModel => _playerModel;

  set playerModel(PlayerModel playerModel) {
    _playerModel = playerModel;
    update();
  }
}

class PlayerModel extends GetxController {
  String _name = '';

  PlayerModel();

  String get name => _name;

  set name(String name) {
    this._name = name;
    update();
  }
}
