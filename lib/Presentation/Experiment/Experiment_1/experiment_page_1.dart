import 'package:flutter/material.dart';
import 'package:lab5_variations/Presentation/Experiment/Widgets/list_experiments.dart';
import 'package:lab5_variations/Presentation/Experiment/Widgets/num_experiments.dart';

class Experiment1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          NumExperiments(),
          SizedBox(height: 10,),
          ListExperiments(numExperiment: 1,)
        ],
      ),
    );
  }
}