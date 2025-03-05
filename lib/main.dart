import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:space_scutum_test_task/app.dart';
import 'package:space_scutum_test_task/features/tasks/data/dto/task_category_dto.dart';
import 'package:space_scutum_test_task/features/tasks/data/dto/task_dto.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  setupInjector();

  runApp(const App());
}

Future initHive() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);

  Hive.registerAdapter(TaskDTOAdapter());
  Hive.registerAdapter(TaskCategoryDTOAdapter());
}
