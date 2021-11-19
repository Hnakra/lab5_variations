import 'package:flutter/material.dart';
/// класс приложения, контактирующий со слоем Presentation и необходимый для оповещения виджетов об изменении списка экспериментов
class ExperimentListModel extends ChangeNotifier{
  List<Map> _list = [];

  addExperiment(Map experiment) {
    _list.add(experiment);
    notifyListeners();
  }
  List<Map> get list =>_list;
}