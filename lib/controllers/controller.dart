import 'package:language_test/viewModel.dart';

class Controller {
  ViewModel _model = ViewModel();

  ViewModel get model => _model;

  void getData() async {
    await Future.delayed(Duration(seconds: 2));
    model.playerModel.name = 'malucao';
  }

  void savePlayer(String name) async {
    await Future.delayed(Duration(seconds: 2));
    _model.playerModel = PlayerModel()..name = name;
  }

  void changeName(String newName) async {
    Future.delayed(Duration(seconds: 1))
        .then((value) => _model.playerModel.name = newName);
  }
}
