import 'package:space_scutum_test_task/features/tasks/data/dto/task_category_dto.dart';

/// Enum representing different categories of tasks
enum TaskCategory {
  all,
  work,
  personal,
  other;

  /// Converts the enum to a DTO
  TaskCategoryDTO toDTO() {
    return TaskCategoryDTO.values[index];
  }

  /// Converts a DTO to an enum
  factory TaskCategory.fromDTO(TaskCategoryDTO category) {
    return values[category.index];
  }
}
