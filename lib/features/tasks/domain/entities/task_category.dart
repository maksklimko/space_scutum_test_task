import 'package:space_scutum_test_task/features/tasks/data/dto/task_category_dto.dart';

enum TaskCategory {
  work,
  personal,
  other;

  TaskCategoryDTO toDTO() {
    return TaskCategoryDTO.values[index];
  }

  factory TaskCategory.fromDTO(TaskCategoryDTO category) {
    return values[category.index];
  }
}
