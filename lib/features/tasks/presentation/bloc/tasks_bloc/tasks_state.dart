part of 'tasks_bloc.dart';

/// Sealed class for all task-related states in TasksBloc
sealed class TasksState extends Equatable {
  /// Whether tasks are grouped by category
  final bool isGrouped;

  /// The current filter category
  final TaskCategory filterCategory;

  const TasksState({
    this.isGrouped = false,
    this.filterCategory = TaskCategory.all,
  });

  /// Creates a new state with the given properties
  TasksState copyWith({
    bool? isGrouped,
    TaskCategory? filterCategory,
  });

  /// Maps the current state to a new type
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

  /// Ensures proper equality check
  @override
  List<Object?> get props => [isGrouped, filterCategory];
}

/// State for ungrouped tasks
class UngroupedTasksState extends TasksState {
  /// The list of tasks
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

/// State for grouped tasks
class GroupedTasksState extends TasksState {
  /// The map of tasks grouped by category
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
