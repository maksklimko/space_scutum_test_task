import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/get_tasks_usecase.dart';

class TasksCubit extends Cubit<List<Task>> {
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  TasksCubit(
    this._getTasksUseCase,
    this._addTaskUseCase,
  ) : super([]);

  Future getTasks() async {
    emit(await _getTasksUseCase.call());
  }

  void addTask() async {
    await _addTaskUseCase(
      Task(
        id: DateTime.now().millisecondsSinceEpoch,
        title: 'title',
        description: 'description',
        isCompleted: false,
        category: TaskCategory.other,
      ),
    );
    await getTasks();
  }
}
