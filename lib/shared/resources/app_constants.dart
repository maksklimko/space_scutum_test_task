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

  static const String weatherApiBaseUrl =
      "https://api.openweathermap.org/data/2.5/";
  static const String weatherIconsUrl = "https://openweathermap.org/img/wn/";

  // Demo coordinates(Lviv, Ukraine)
  static const demoLatitude = 49.842957;
  static const demoLongitude = 24.031111;
}
