import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:space_scutum_test_task/features/weather/domain/repositories/weather_repository.dart';
import 'package:space_scutum_test_task/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:space_scutum_test_task/features/weather/presentation/bloc/weather_cubit/weather_cubit.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';
import 'package:space_scutum_test_task/shared/utils/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => TasksBloc(
            GetTasksUseCase(getIt<TasksRepository>()),
            UpdateTaskUsecase(getIt<TasksRepository>()),
            DeleteTaskUsecase(getIt<TasksRepository>()),
          )..add(GetTasksEvent()),
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
        BlocProvider(
          create: (ctx) => WeatherCubit(
            GetWeatherUseCase(getIt<WeatherRepository>()),
          )..getWeatherData(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
