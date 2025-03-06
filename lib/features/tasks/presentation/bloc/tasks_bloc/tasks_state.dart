part of 'tasks_bloc.dart';

sealed class TasksState extends Equatable {
  final bool isGrouped;
  final TaskCategory filterCategory;

  const TasksState({
    this.isGrouped = false,
    this.filterCategory = TaskCategory.all,
  });

  TasksState copyWith({
    bool? isGrouped,
    TaskCategory? filterCategory,
  });

  T map<T>({
    required T Function(UngroupedTasksState state) ungrouped,
    required T Function(GroupedTasksState state) grouped,
  }) {
    if (this is UngroupedTasksState) {
      return ungrouped(this as UngroupedTasksState);
    } else if (this is GroupedTasksState) {
      return grouped(this as GroupedTasksState);
    }
    throw Exception("Unhandled state: $this");
  }

  // Ensures proper equality check
  @override
  List<Object?> get props => [isGrouped, filterCategory];
}

class UngroupedTasksState extends TasksState {
  final List<Task> tasks;

  const UngroupedTasksState({
    this.tasks = const [],
    super.isGrouped,
    super.filterCategory,
  });

  @override
  UngroupedTasksState copyWith({
    List<Task>? tasks,
    bool? isGrouped,
    TaskCategory? filterCategory,
  }) {
    return UngroupedTasksState(
      tasks: tasks ?? this.tasks,
      isGrouped: isGrouped ?? this.isGrouped,
      filterCategory: filterCategory ?? this.filterCategory,
    );
  }

  // Ensures proper equality check
  @override
  List<Object?> get props => super.props + [tasks];
}

class GroupedTasksState extends TasksState {
  final Map<TaskCategory, List<Task>> tasks;

  const GroupedTasksState({
    this.tasks = const {},
    super.isGrouped,
    super.filterCategory,
  });

  @override
  GroupedTasksState copyWith({
    Map<TaskCategory, List<Task>>? tasks,
    bool? isGrouped,
    TaskCategory? filterCategory,
  }) {
    return GroupedTasksState(
      tasks: tasks ?? this.tasks,
      isGrouped: isGrouped ?? this.isGrouped,
      filterCategory: filterCategory ?? this.filterCategory,
    );
  }

  // Ensures proper equality check
  @override
  List<Object?> get props => super.props + [tasks];
}
