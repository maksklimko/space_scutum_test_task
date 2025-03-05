import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/shared/resources/app_spacers.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/widgets/task_tile.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.3, // 30% of screen height
            child: Placeholder(),
          ),
          SizedBox(
            height: screenHeight * 0.7, // 70% of screen height
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskTile();
              },
              separatorBuilder: (context, index) => AppSpacers.v10px,
            ),
          ),
        ],
      ),
    );
  }
}
