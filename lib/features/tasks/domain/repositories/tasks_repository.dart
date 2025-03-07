import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';

/// Repository interface for managing tasks
/// Provides methods for CRUD operations on tasks
abstract class TasksRepository {
  /// Gets all tasks from the repository
  Future<List<Task>> getTasks();

  /// Adds a new task to the repository
  Future<void> addTask(Task task);

  /// Updates an existing task in the repository
  Future<void> updateTask(Task task);

  /// Deletes a task from the repository by [id]
  Future<void> deleteTask(int id);
}
