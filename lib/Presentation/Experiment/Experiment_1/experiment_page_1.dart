import 'package:flutter/material.dart';
import 'package:lab5_variations/Presentation/Experiment/Widgets/list_experiments.dart';
import 'package:lab5_variations/Presentation/Experiment/Widgets/num_experiments.dart';

class Experiment1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumExperiments(),
        ListExperiments(numExperiment: 1,)
      ],
    );
  }
}