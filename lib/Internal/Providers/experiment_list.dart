import 'package:flutter/material.dart';
import 'package:lab5_variations/Data/api/api.dart';

class ExperimentListModel extends ChangeNotifier{
  List<Map> _list = [];
  ExperimentListModel(){
    Api.result.stream.listen((Map event) {
      switch(event['operation']){
        case "getExperiments":
          _list = event['result'];
          break;
      }
      notifyListeners();
    });
  }

  addExperiment(Map experiment) {
    _list.add(experiment);
    Api.command.add({
      "operation": "addExperiment",
      "data": experiment
    });
    notifyListeners();
  }
  List<Map> get list =>_list;
}