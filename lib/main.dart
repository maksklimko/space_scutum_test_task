import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/app.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();

  runApp(const App());
}
