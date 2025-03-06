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
            height: screenHeight * 0.2, // 20% of screen height
            child: Placeholder(),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.15, // 15% of screen height
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: Text('Group'),
                          selected: state.isGrouped,
                          onSelected: (value) {
                            context.read<TasksBloc>().add(ToggleIsGrouped());
                          },
                        ),
                        _getFilters(context, state),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.55, // 55% of screen height
                    child: ListView.separated(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          task: state.tasks[index],
                        );
                      },
                      separatorBuilder: (context, index) => AppSpacers.v10px,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  _getFilters(BuildContext context, TasksState state) {
    const List<(TaskCategory, String)> filters = <(TaskCategory, String)>[
      (TaskCategory.all, 'All'),
      (TaskCategory.work, 'Work'),
      (TaskCategory.personal, 'Personal'),
      (TaskCategory.other, 'Other'),
    ];

    return SegmentedButton(
      segments: filters
          .map<ButtonSegment<TaskCategory>>(((TaskCategory, String) filter) {
        return ButtonSegment<TaskCategory>(
          value: filter.$1,
          label: Text(filter.$2),
        );
      }).toList(),
      expandedInsets: EdgeInsets.zero,
      selectedIcon: SizedBox.shrink(),
      selected: {state.filterCategory},
      onSelectionChanged: (category) {
        context.read<TasksBloc>().add(SelectFilterCategory(category.first));
      },
    );
  }
}
