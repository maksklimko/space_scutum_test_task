import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

/// Usecase for adding a new task
class AddTaskUseCase {
  final TasksRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(Task task) async {
    return await repository.addTask(task);
  }
}
