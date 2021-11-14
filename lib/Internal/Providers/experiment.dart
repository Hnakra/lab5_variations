import 'package:flutter/material.dart';
import 'package:lab5_variations/Data/api/api.dart';

class ExperimentModel extends ChangeNotifier{
  String name;
  int numVDI;
  List<String> alphabet;
  int numExperiments = 10;
  final TextEditingController numExperimentsController = TextEditingController();
  Map? resultExperiment1;
  Map? resultExperiment2;

  ExperimentModel({required this.name, required this.numVDI, required this.alphabet, required BuildContext context}){
    numExperimentsController.addListener(() {
      numExperiments = numExperimentsController.text.isEmpty? 0: int.parse(numExperimentsController.text);
      Api.command.add({
        "operation": "experiment_1",
        "alphabet": alphabet,
        "numExperiments": numExperiments,
      });
      Api.command.add({
        "operation": "experiment_2",
        "alphabet": alphabet,
        "numVDI": numVDI,
        "numExperiments": numExperiments,
      });
    });
    Api.result.stream.listen((Map event) {
      switch(event['operation']){
        case "experiment_1":
          resultExperiment1 = event['result'];
          break;
        case "experiment_2":
          resultExperiment2 = event['result'];
          break;
      }
      notifyListeners();
    });
    numExperimentsController.text = "10";
  }

}