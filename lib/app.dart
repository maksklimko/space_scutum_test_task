import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/tasks_list_screen.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => TasksCubit(
        GetTasksUseCase(getIt<TasksRepository>()),
        AddTaskUseCase(getIt<TasksRepository>()),
      )..getTasks(),
      child: const MaterialApp(
        home: TasksListScreen(),
      ),
    );
  }
}
