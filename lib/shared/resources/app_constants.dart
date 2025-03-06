import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/shared/resources/app_strings.dart';

class AppConstants {
  AppConstants._();

  static List<(TaskCategory, String)> getCategoriesOptions({
    bool includeAll = true,
  }) =>
      [
        if (includeAll) (TaskCategory.all, AppStrings.all),
        (TaskCategory.work, AppStrings.work),
        (TaskCategory.personal, AppStrings.personal),
        (TaskCategory.other, AppStrings.other),
      ];

  static const String weatherApiBaseUrl =
      "https://api.openweathermap.org/data/2.5/";
  static const String weatherIconsUrl = "https://openweathermap.org/img/wn/";

  // Demo coordinates(Lviv, Ukraine)
  static const demoLatitude = 49.842957;
  static const demoLongitude = 24.031111;
}
