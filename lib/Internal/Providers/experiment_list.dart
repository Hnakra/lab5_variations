import 'package:flutter/material.dart';

class ExperimentListModel extends ChangeNotifier{
  List<Map> _list = [];

  addExperiment(Map experiment) {
    _list.add(experiment);
    notifyListeners();
  }
  List<Map> get list =>_list;
}