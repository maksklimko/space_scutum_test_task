import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:space_scutum_test_task/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:space_scutum_test_task/features/tasks/data/sources/tasks_hive_data_source.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:space_scutum_test_task/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:space_scutum_test_task/features/weather/data/sources/weather_remote_data_source.dart';
import 'package:space_scutum_test_task/features/weather/domain/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void setupInjector() {
  //Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Register Data Sources
  getIt.registerLazySingleton<TasksHiveDataSource>(() => TasksHiveDataSource());
  getIt.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSource(getIt<Dio>()),
  );

  // Register Repositories
  getIt.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(
      getIt<TasksHiveDataSource>(),
    ),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      getIt<WeatherRemoteDataSource>(),
    ),
  );
}
