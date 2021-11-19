
import 'package:flutter/material.dart';
import 'package:lab5_variations/Internal/Providers/experiment_list.dart';
import 'package:provider/provider.dart';

class ExperimentListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<Map> experiments = context.watch<ExperimentListModel>().list;
    return Scaffold(
      appBar: AppBar(
        title: Text("Список экспериментов"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            for(Map experiment in experiments)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: experimentTile(context, experiment),
              )
            ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, '/new_experiment'),
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }
  experimentTile(BuildContext context, Map experiment){
    return GestureDetector(

        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 3),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(experiment["name"]),
                Text("Кол-во ВДИ: ${experiment["numVDI"]}"),
                Text("Мощность алфавита: ${experiment["alphabet"].length}")
              ]
            ),
          ),

      ),
      onTap: ()=> Navigator.pushNamed(context, '/experiment', arguments: {"experiment": experiment})
    );
  }
}
