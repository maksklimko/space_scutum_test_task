part of 'tasks_bloc.dart';

class TasksState {
  final List<Task> tasks;
  final bool isGrouped;
  final TaskCategory filterCategory;

  const TasksState({
    this.tasks = const [],
    this.isGrouped = false,
    this.filterCategory = TaskCategory.all,
  });

  TasksState copyWith({
    List<Task>? tasks,
    bool? isGrouped,
    TaskCategory? filterCategory,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isGrouped: isGrouped ?? this.isGrouped,
      filterCategory: filterCategory ?? this.filterCategory,
    );
  }
}
