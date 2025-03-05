import 'package:get_it/get_it.dart';
import 'package:space_scutum_test_task/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:space_scutum_test_task/features/tasks/data/sources/tasks_hive_data_source.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';

final getIt = GetIt.instance;

void setupInjector() {
  // Register Data Sources
  getIt.registerLazySingleton<TasksHiveDataSource>(() => TasksHiveDataSource());

  // Register Repositories
  getIt.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(
      getIt<TasksHiveDataSource>(),
    ),
  );
}
