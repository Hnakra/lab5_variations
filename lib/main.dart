import 'package:flutter/material.dart';
import 'package:lab5_variations/Internal/application.dart';

import 'Data/api/api.dart';

Future<void> main() async {
  await Api.init();
  runApp(MyApp());
}