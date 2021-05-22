import 'package:language_test/get/viewModel.dart';

class Controller {
  ViewModel _model = ViewModel();

  ViewModel get model => _model;

  void getData() async {
    _model.setPlayer = PlayerModel('unknwon', 'unknown');
  }

  void savePlayer(String name) async {
    _model.setPlayer = PlayerModel(_model.getPlayer.value.id, name);
  }

  void changeName(String newName) async {
    _model.getPlayer.value.name = newName;
  }

  void isWaitingAudio() {
    _model.audioModel.isWaiting = true;
  }

  void isNotWaitingAudio() {
    _model.audioModel.isWaiting = false;
  }

  void changeURL(String url) {
    _model.audioModel.url = url;
  }

  void changeFailure(String newValue) {
    _model.audioModel.failure = newValue;
  }
}
