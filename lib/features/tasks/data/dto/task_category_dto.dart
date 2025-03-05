import 'package:hive/hive.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';

part 'task_category_dto.g.dart';

@HiveType(typeId: 1)
enum TaskCategoryDTO {
  @HiveField(0)
  work,
  @HiveField(1)
  personal,
  @HiveField(2)
  other;

  TaskCategory toDomain() {
    return TaskCategory.values[index];
  }

  factory TaskCategoryDTO.fromDomain(TaskCategory category) {
    return values[category.index];
  }
}
