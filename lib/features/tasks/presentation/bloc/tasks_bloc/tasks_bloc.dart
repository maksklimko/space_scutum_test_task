import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

/// Bloc for managing tasks
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  // Usecases
  final GetTasksUseCase _getTasksUseCase;
  final UpdateTaskUsecase _updateTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;

  // Cached tasks for optimized filtering
  List<Task> cachedTasks = [];

  TasksBloc(
    this._getTasksUseCase,
    this._updateTaskUsecase,
    this._deleteTaskUsecase,
  ) : super(UngroupedTasksState()) {
    on<GetTasksEvent>(_onGetTasks);
    on<ToggleTaskCompletionEvent>(_onToggleTaskCompletion);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<ToggleIsGrouped>(_onToggleIsGrouped);
    on<SelectFilterCategory>(_onSelectFilterCategory);
  }

  /// Fetches tasks from the repository and updates the state
  Future<void> _onGetTasks(
      GetTasksEvent event, Emitter<TasksState> emit) async {
    final tasks = await _getTasksUseCase.call();
    cachedTasks = tasks;
    _displayTasks(emit);
  }

  /// Toggles the completion status of a task
  Future<void> _onToggleTaskCompletion(
      ToggleTaskCompletionEvent event, Emitter<TasksState> emit) async {
    await _updateTaskUsecase.call(
      event.task.copyWith(isCompleted: !event.task.isCompleted),
    );
    add(GetTasksEvent());
  }

  /// Deletes a task from the repository and updates the state
  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TasksState> emit) async {
    await _deleteTaskUsecase.call(event.id);
    add(GetTasksEvent());
  }

  /// Toggles the grouping status of tasks
  Future<void> _onToggleIsGrouped(
      ToggleIsGrouped event, Emitter<TasksState> emit) async {
    emit(state.copyWith(isGrouped: !state.isGrouped));
    _displayTasks(emit);
  }

  /// Selects a filter category and updates the state
  Future<void> _onSelectFilterCategory(
      SelectFilterCategory event, Emitter<TasksState> emit) async {
    emit(state.copyWith(filterCategory: event.category));
    _displayTasks(emit);
  }

  /// Gets filtered tasks based on the selected category
  List<Task> _getFilteredTasks(List<Task> tasks, TaskCategory category) {
    final t = cachedTasks.where((e) {
      return category == TaskCategory.all || e.category == category;
    }).toList();
    return t;
  }

  /// Groups tasks based on the selected category
  Map<TaskCategory, List<Task>> _groupTasks(List<Task> tasks) {
    final groupedTasks = TaskCategory.values.sublist(1).asMap().map((index, e) {
      return MapEntry(e, _getFilteredTasks(tasks, e));
    });
    if (state.filterCategory != TaskCategory.all) {
      return {state.filterCategory: groupedTasks[state.filterCategory] ?? []};
    }
    return groupedTasks;
  }

  /// Displays tasks based on the current state
  void _displayTasks(Emitter<TasksState> emit) {
    final currentState = state;

    final newState = switch (currentState.isGrouped) {
      true => GroupedTasksState(
          tasks: _groupTasks(
            _getFilteredTasks(cachedTasks, state.filterCategory),
          ),
        ),
      false => UngroupedTasksState(
          tasks: _getFilteredTasks(cachedTasks, state.filterCategory)),
    };

    emit(
      newState.copyWith(
        isGrouped: currentState.isGrouped,
        filterCategory: currentState.filterCategory,
      ),
    );
  }
}
