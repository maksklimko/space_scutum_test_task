import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:space_scutum_test_task/shared/resources/app_spacers.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/widgets/task_tile.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: context.read<TasksCubit>().addTask),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.3, // 30% of screen height
            child: Placeholder(),
          ),
          SizedBox(
            height: screenHeight * 0.7, // 70% of screen height
            child: BlocBuilder<TasksCubit, List<Task>>(
              builder: (context, state) {
                return ListView.separated(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return TaskTile(
                      task: state[index],
                    );
                  },
                  separatorBuilder: (context, index) => AppSpacers.v10px,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
