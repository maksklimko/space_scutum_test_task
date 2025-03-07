import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

/// Usecase for deleting a task by [id]
class DeleteTaskUsecase {
  final TasksRepository repository;

  DeleteTaskUsecase(this.repository);

  Future call(int id) async {
    return await repository.deleteTask(id);
  }
}
