import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab5_variations/Internal/Providers/experiment.dart';
import 'package:provider/src/provider.dart';

class NumExperiments extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Кол-во проводимых опытов"),
        TextField(
            controller: context.read<ExperimentModel>().numExperimentsController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ]
        ),
      ],
    );
  }
}