import 'package:space_scutum_test_task/features/tasks/data/dto/task_dto.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final TaskCategory category;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.category = TaskCategory.other,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    TaskCategory? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }

  TaskDTO toDTO() {
    return TaskDTO(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      category: category.toDTO(),
    );
  }

  factory Task.fromDTO(TaskDTO task) {
    return Task(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      category: task.category.toDomain(),
    );
  }
}
