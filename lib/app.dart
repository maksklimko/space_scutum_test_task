import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/screens/tasks_list_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TasksListScreen(),
    );
  }
}
