import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';

class AppConstants {
  AppConstants._();

  static List<(TaskCategory, String)> getCategoriesOptions({
    bool includeAll = true,
  }) =>
      [
        if (includeAll) (TaskCategory.all, 'All'),
        (TaskCategory.work, 'Work'),
        (TaskCategory.personal, 'Personal'),
        (TaskCategory.other, 'Other'),
      ];
}
