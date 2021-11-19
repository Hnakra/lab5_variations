import 'package:flutter/material.dart';
import 'package:lab5_variations/Presentation/Experiment/experiment.dart';
import 'package:lab5_variations/Presentation/ExperimentList/page_experiment_list.dart';
import 'package:lab5_variations/Presentation/NewExperiment/new_experiment_page.dart';
import 'package:provider/provider.dart';

import 'Providers/experiment_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ExperimentListModel(),
          )
        ],
      child: MaterialApp(
        title: 'Lab5 Experiments',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20))),
            textTheme: TextTheme(
                bodyText2: TextStyle(fontSize: 18),
            ),
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.yellow.shade100

        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ExperimentListPage(),
          '/new_experiment': (context) => NewExperimentPage(),
          '/experiment': (context) => ExperimentPage(),
        },
      )
    );
  }
}