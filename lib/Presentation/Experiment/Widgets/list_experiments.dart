import 'package:flutter/material.dart';
import 'package:lab5_variations/Internal/Providers/experiment.dart';
import 'package:provider/src/provider.dart';

class ListExperiments extends StatelessWidget{
  int numExperiment;
  ListExperiments({required this.numExperiment}):  super(key: Key(numExperiment.toString()));


  @override
  Widget build(BuildContext context) {
    Map? data = numExperiment == 1 ? context.watch<ExperimentModel>().resultExperiment1 : context.watch<ExperimentModel>().resultExperiment2;
    List<TableRow> listExperiments = [
      TableRow(children:[
        Text("Слово"),
        Text("Вероятность")
      ]),
    ];
    if(data != null) {
      data.forEach((key, value) {
      listExperiments.add(
        TableRow(children: [
          Text(key.toString()),
          Text(value.toString())
        ])
      );
    });
    }
    return Column(
      children: [
        Text("Результат"),
        SizedBox(height: 10,),
        data == null ? circularProgress(): Table(
          children: listExperiments,
        )
      ],
    );
  }
  circularProgress() {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      ),
    );
  }
}