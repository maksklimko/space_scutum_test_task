import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int id);
}
