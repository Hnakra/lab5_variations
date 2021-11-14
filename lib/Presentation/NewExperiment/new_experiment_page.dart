import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab5_variations/Internal/Providers/experiment_list.dart';
import 'package:provider/provider.dart';

class NewExperimentPage extends StatelessWidget{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numVDI = TextEditingController();
  final TextEditingController _alphabet = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Создание эксперимента")),
      body: SafeArea(
        child: Column(
          children: [
            Text("Введите название эксперимента"),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Название Эксперимента"
              ),
            ),
            Text("Введите кол-во ВДИ"),
            TextField(
                controller: _numVDI,
                decoration: InputDecoration(
                    labelText: "Кол-во ВДИ"
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ]
            ),
            Text("Введите алфавит через пробел:"),
            TextField(
              controller: _alphabet,
              decoration: InputDecoration(
                  labelText: "Алфавит"
              ),
            ),
            ElevatedButton(
              child: Text("Создать эксперимент"),
              onPressed: () => _createExperiment(context),
            )
          ],
        ),
      )
    );
  }
  _createExperiment(BuildContext context){
    List<String> alphabet = _alphabet.text.split(" ");
    Map experiment = {
      "name": _nameController.text,
      "numVDI": _numVDI.text,
      "alphabet": alphabet
    };
    context.read<ExperimentListModel>().addExperiment(experiment);
    Navigator.pop(context);
  }
}