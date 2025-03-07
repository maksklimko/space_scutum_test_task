import 'package:hive_flutter/hive_flutter.dart';
import 'package:space_scutum_test_task/features/tasks/data/dto/task_category_dto.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
part 'task_dto.g.dart';

/// Data Transfer Object for Task entity
/// Used for serialization/deserialization with Hive storage
@HiveType(typeId: 0)
class TaskDTO {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool isCompleted;
  @HiveField(4)
  final TaskCategoryDTO category;

  TaskDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.category,
  });

  /// Converts a DTO to a domain entity
  Task toDomain() {
    return Task(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      category: category.toDomain(),
    );
  }

  /// Creates a DTO from a domain entity
  factory TaskDTO.fromDomain(Task task) {
    return TaskDTO(
      id: task.id,
      description: task.description,
      title: task.title,
      isCompleted: task.isCompleted,
      category: TaskCategoryDTO.fromDomain(task.category),
    );
  }
}
