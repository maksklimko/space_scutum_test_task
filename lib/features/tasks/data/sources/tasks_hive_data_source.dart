import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:space_scutum_test_task/features/tasks/data/dto/task_category_dto.dart';
import 'package:space_scutum_test_task/features/tasks/data/dto/task_dto.dart';

class TasksHiveDataSource {
  static const String _boxName = 'TaskBox';
  var isInitialized = false;

  Future initHive() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);

    Hive.registerAdapter(TaskDTOAdapter());
    Hive.registerAdapter(TaskCategoryDTOAdapter());
  }

  Future<Box<TaskDTO>> _getBox() async {
    if (!isInitialized) {
      await initHive();
      isInitialized = true;

      return Hive.openBox<TaskDTO>(_boxName);
    }
    return Hive.box(_boxName);
  }

  Future<List<TaskDTO>> getTasks() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> addTask(TaskDTO task) async {
    final box = await _getBox();
    await box.put(task.id.toString(), task);
  }

  Future<void> updateTask(TaskDTO task) async {
    final box = await _getBox();
    if (box.containsKey(task.id)) {
      await box.put(task.id, task);
    }
  }

  Future<void> deleteTask(int id) async {
    final box = await _getBox();
    await box.delete(id);
  }
}
