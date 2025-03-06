import 'package:go_router/go_router.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/tasks_list_screen.dart';
import 'package:space_scutum_test_task/shared/resources/app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.tasksListPath,
  routes: [
    GoRoute(
      name: AppRoutes.tasksList,
      path: AppRoutes.tasksListPath,
      builder: (context, state) => TasksListScreen(),
    ),
    GoRoute(
      name: AppRoutes.addTask,
      path: AppRoutes.addTaskPath,
      builder: (context, state) => AddTaskScreen(),
    ),
  ],
);
