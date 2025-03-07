import 'package:space_scutum_test_task/features/tasks/data/sources/tasks_hive_data_source.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

/// Implementation of [TasksRepository] that uses Hive for local storage
/// Handles conversion between domain entities and DTOs
class TasksRepositoryImpl implements TasksRepository {
  final TasksHiveDataSource hiveDataSource;

  TasksRepositoryImpl(this.hiveDataSource);

  @override
  Future<List<Task>> getTasks() async {
    return (await hiveDataSource.getTasks()).map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> addTask(Task todo) async {
    await hiveDataSource.addTask(todo.toDTO());
  }

  @override
  Future<void> updateTask(Task todo) async {
    await hiveDataSource.updateTask(todo.toDTO());
  }

  @override
  Future<void> deleteTask(int id) async {
    await hiveDataSource.deleteTask(id);
  }
}
