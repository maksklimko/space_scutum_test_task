part of 'add_task_cubit.dart';

/// Sealed class for all add task-related states in AddTaskCubit
sealed class AddTaskState extends Equatable {
  const AddTaskState(
      {this.title = '',
      this.description = '',
      this.category = TaskCategory.other});

  /// The title of the task
  final String title;

  /// The description of the task
  final String description;

  /// The category of the task
  final TaskCategory category;

  /// Creates a new state with the given properties
  AddTaskState copyWith({
    String? title,
    String? description,
    TaskCategory? category,
  });

  /// Ensures proper equality check
  @override
  List<Object> get props => [title, description, category];
}

/// Initial state for the add task form
final class AddTaskInitial extends AddTaskState {
  const AddTaskInitial({
    super.title = '',
    super.description = '',
    super.category = TaskCategory.other,
  });

  @override
  AddTaskInitial copyWith({
    String? title,
    String? description,
    TaskCategory? category,
  }) {
    return AddTaskInitial(
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }
}
