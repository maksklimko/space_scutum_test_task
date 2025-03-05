import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

class GetTasksUseCase {
  final TasksRepository repository;

  GetTasksUseCase(this.repository);

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
