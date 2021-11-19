import 'package:flutter/material.dart';
import 'package:lab5_variations/Internal/Providers/experiment.dart';
import 'package:lab5_variations/Internal/Providers/experiment.dart';
import 'package:lab5_variations/Internal/Providers/experiment_list.dart';
import 'package:provider/provider.dart';

import 'Experiment_1/experiment_page_1.dart';
import 'Experiment_2/experiment_page_2.dart';

class ExperimentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ExperimentModel(
              name: args["experiment"]["name"],
              numVDI: int.parse(args["experiment"]["numVDI"]),
              alphabet: args["experiment"]["alphabet"],
              context: context,
            ),
          )
        ],
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
                appBar: AppBar(
                  title: Text("kek"),
                  bottom: TabBar(
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(
                        child: Center(child: Text("Опыт 1")),
                      ),
                      Tab(
                        child: Center(child: Text("Опыт 2")),
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Experiment1(),
                    Experiment2()
                  ],
                )),
          )
        );
  }
}
