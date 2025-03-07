import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

/// Usecase for updating a task
class UpdateTaskUsecase {
  final TasksRepository repository;

  UpdateTaskUsecase(this.repository);

  Future call(Task task) async {
    return await repository.updateTask(task);
  }
}
