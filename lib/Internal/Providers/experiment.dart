import 'package:flutter/material.dart';
import 'package:lab5_variations/Data/api/api.dart';
/// класс приложения, контактираующий с Presentation слоем и необходимый для оповещения вижетов об изменениях на странице экспериментов
class ExperimentModel extends ChangeNotifier{
  /// название эксперимента
  String name;
  /// кол-во ВДИ (Вероятностно-дискретных источников)
  int numVDI;
  /// алфавит символов
  List<String> alphabet;
  /// кол-во экспериментов, которые будут проведены
  int numExperiments = 10;
  /// контроллер текстового поля, который отслеживает состояние кол-ва экспериментов
  final TextEditingController numExperimentsController = TextEditingController();
  /// ассоциативный список "Символ алфавита" : вероятность возникновения этого случайного независимого события
  Map? resultExperiment1;
  /// ассоциативный список "Комбинация символов алфавита" : вероятность возникеования этой случайной комбинации
  Map? resultExperiment2;
  /// переменная, которая подписывается и слушает поток, находящийся на стороне API
  var  _listener;

  ExperimentModel({required this.name, required this.numVDI, required this.alphabet, required BuildContext context}){
    numExperimentsController.addListener(() {
      /// получение кол-ва экспериментов
      numExperiments = numExperimentsController.text.isEmpty? 0: int.parse(numExperimentsController.text);
      /// отпавим в API команду для получения 1 списка
      Api.command.add({
        "operation": "experiment_1",
        "alphabet": alphabet,
        "numExperiments": numExperiments,
      });
      /// отправим в API команду для получения 2 списка
      Api.command.add({
        "operation": "experiment_2",
        "alphabet": alphabet,
        "numVDI": numVDI,
        "numExperiments": numExperiments,
      });
    });
    /// подпишемся на поток результата, записываем данные в тот или иной массив, смотря что пришло
    _listener = Api.result.stream.listen((Map event) {
      switch(event['operation']){
        case "experiment_1":
          resultExperiment1 = event['result'];
          break;
        case "experiment_2":
          resultExperiment2 = event['result'];
          break;
      }
      /// уведомляем подписанные на watch виджеты, что данные поменялись
      notifyListeners();
    });
    numExperimentsController.text = "10";
  }
@override
  void dispose() {
    /// при уничтожении этого объекта, остановим уже неиспользуемую подписку
  _listener.cancel ();
    super.dispose();
  }
}