import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:space_scutum_test_task/shared/resources/app_spacers.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/widgets/task_tile.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<TasksBloc>().add(AddTaskEvent(
              Task(
                id: DateTime.now().millisecondsSinceEpoch,
                title: 'title',
                description: 'description',
                isCompleted: false,
                category: TaskCategory.other,
              ),
            ));
      }),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.3, // 30% of screen height
            child: Placeholder(),
          ),
          SizedBox(
            height: screenHeight * 0.7, // 70% of screen height
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return switch (state) {
                  TasksInitial() => Center(child: CircularProgressIndicator()),
                  TasksLoaded(:final tasks) => ListView.separated(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          task: tasks[index],
                        );
                      },
                      separatorBuilder: (context, index) => AppSpacers.v10px,
                    ),
                  _ => Center(child: Text("Unexpected state")),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
