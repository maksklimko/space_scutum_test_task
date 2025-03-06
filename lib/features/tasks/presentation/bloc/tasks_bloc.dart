import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/update_task_usecase.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetTasksUseCase _getTasksUseCase;
  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUsecase _updateTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;

  TasksBloc(
    this._getTasksUseCase,
    this._addTaskUseCase,
    this._updateTaskUsecase,
    this._deleteTaskUsecase,
  ) : super(TasksState()) {
    on<GetTasksEvent>(_onGetTasks);
    on<AddTaskEvent>(_onAddTask);
    on<ToggleTaskCompletionEvent>(_onToggleTaskCompletion);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<ToggleIsGrouped>(_onToggleIsGrouped);
    on<SelectFilterCategory>(_onSelectFilterCategory);
  }

  Future<void> _onGetTasks(
      GetTasksEvent event, Emitter<TasksState> emit) async {
    final tasks = await _getTasksUseCase.call();
    emit(state.copyWith(tasks: tasks));
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) async {
    await _addTaskUseCase(event.task);
    add(GetTasksEvent());
  }

  Future<void> _onToggleTaskCompletion(
      ToggleTaskCompletionEvent event, Emitter<TasksState> emit) async {
    await _updateTaskUsecase.call(
      event.task.copyWith(isCompleted: !event.task.isCompleted),
    );
    add(GetTasksEvent());
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    await _deleteTaskUsecase.call(event.id);
    add(GetTasksEvent());
  }

  Future<void> _onToggleIsGrouped(
      ToggleIsGrouped event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isGrouped: !state.isGrouped));
  }

  Future<void> _onSelectFilterCategory(
      SelectFilterCategory event, Emitter<TasksState> emit) async {
    emit(state.copyWith(filterCategory: event.category));
  }
}
