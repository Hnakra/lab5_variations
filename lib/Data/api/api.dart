import 'dart:async';

import 'package:lab5_variations/Data/api/calculate_experiment_1.dart';
import 'package:lab5_variations/Data/api/save_data.dart';

import 'calculate_experiment_2.dart';

class Api {
  /// отсюда из Аpi приходят результаты вычислений
  static final StreamController<Map> result = StreamController();
  /// сюда приходят все команды для Api
  static final StreamController<Map> command = StreamController();
  static Future<void> init() async {
    await Store.init();
    command.stream.listen((Map event) {
      switch(event['operation']){
        case "experiment_1":
          result.add({
            "operation": event['operation'],
            "result": Experiment1.calculate(alphabet: event['alphabet'], numExperiments: event['numExperiments'])
          });
          break;
        case "experiment_2":
          result.add({
            "operation": event['operation'],
            "result": Experiment2.calculate(alphabet: event['alphabet'], numExperiments: event['numExperiments'], numVDI: event['numVDI'])
          });
          break;
        case "addExperiments":
          Store.add(event['data']);
          break;
        case "getExperiments":
          result.add({
            "operation": event['operation'],
            "result": Store.get()
          });
          break;
      }
    });
  }
}