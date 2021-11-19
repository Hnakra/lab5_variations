import 'dart:async';

import 'package:lab5_variations/Data/api/calculate_experiment_1.dart';

import 'calculate_experiment_2.dart';

class Api {
  /// отсюда из Аpi уходят результаты вычислений
  static final  result = StreamController<Map>.broadcast();
  /// сюда приходят все команды для Api
  static final StreamController<Map> command = StreamController();
  /// функция, которая должна быть проинициализирована при старте программы
  static Future<void> init() async {
    /// слушаем, что нам приходит в команды, в зависимости от этого, кладем в поток result тот или иной результат вычислений
    command.stream.listen((Map event) {
      switch(event['operation']){
        case "experiment_1":
          result.sink.add({
            "operation": event['operation'],
            "result": Experiment1.calculate(alphabet: event['alphabet'], numExperiments: event['numExperiments'])
          });
          break;
        case "experiment_2":
          result.sink.add({
            "operation": event['operation'],
            "result": Experiment2.calculate(alphabet: event['alphabet'], numExperiments: event['numExperiments'], numVDI: event['numVDI'])
          });
          break;
      }
    });
  }
}