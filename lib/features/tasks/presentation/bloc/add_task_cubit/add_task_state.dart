part of 'add_task_cubit.dart';

sealed class AddTaskState extends Equatable {
  const AddTaskState(
      {this.title = '',
      this.description = '',
      this.category = TaskCategory.other});

  final String title;
  final String description;
  final TaskCategory category;

  AddTaskState copyWith({
    String? title,
    String? description,
    TaskCategory? category,
  });

  @override
  List<Object> get props => [title, description, category];
}

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
