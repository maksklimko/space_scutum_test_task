import 'package:go_router/go_router.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/tasks_list_screen.dart';
import 'package:space_scutum_test_task/shared/resources/app_routes.dart';

// Application router configuration using GoRouter
// Defines the navigation structure and routes of the app
final router = GoRouter(
  // Set initial route to the tasks list screen
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
