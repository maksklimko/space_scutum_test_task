import 'package:hive_flutter/hive_flutter.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';

part 'task_category_dto.g.dart';

/// DTO enum for task categories with Hive serialization
@HiveType(typeId: 1)
enum TaskCategoryDTO {
  @HiveField(0)
  all,
  @HiveField(1)
  work,
  @HiveField(2)
  personal,
  @HiveField(3)
  other;

  /// Converts the DTO to an enum
  TaskCategory toDomain() {
    return TaskCategory.values[index];
  }

  /// Creates a new DTO from an enum
  factory TaskCategoryDTO.fromDomain(TaskCategory category) {
    return values[category.index];
  }
}
