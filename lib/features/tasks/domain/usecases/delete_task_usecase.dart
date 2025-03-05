import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

class DeleteTaskUsecase {
  final TasksRepository repository;

  DeleteTaskUsecase(this.repository);

  Future call(int id) async {
    return await repository.deleteTask(id);
  }
}
