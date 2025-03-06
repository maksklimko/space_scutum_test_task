import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:space_scutum_test_task/features/weather/presentation/widgets/weather_widget.dart';
import 'package:space_scutum_test_task/shared/resources/app_colors.dart';
import 'package:space_scutum_test_task/shared/resources/app_constants.dart';
import 'package:space_scutum_test_task/shared/resources/app_routes.dart';
import 'package:space_scutum_test_task/shared/resources/app_spacers.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/widgets/task_tile.dart';
import 'package:space_scutum_test_task/shared/resources/app_strings.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.pushNamed(AppRoutes.addTask);
      }),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.2, // 20% of screen height
            child: WeatherWidget(),
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
                          label: Text(AppStrings.group),
                          selected: state.isGrouped,
                          onSelected: (value) {
                            context.read<TasksBloc>().add(ToggleIsGrouped());
                          },
                        ),
                        SegmentedButton(
                          segments: AppConstants.getCategoriesOptions()
                              .map<ButtonSegment<TaskCategory>>(
                                  ((TaskCategory, String) filter) {
                            return ButtonSegment<TaskCategory>(
                              value: filter.$1,
                              label: Text(filter.$2),
                            );
                          }).toList(),
                          expandedInsets: EdgeInsets.zero,
                          selectedIcon: SizedBox.shrink(),
                          selected: {state.filterCategory},
                          onSelectionChanged: (category) {
                            context
                                .read<TasksBloc>()
                                .add(SelectFilterCategory(category.first));
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.65, // 65% of screen height
                    child: state.map(
                      ungrouped: (state) => _buildUngroupedTasks(state),
                      grouped: (state) => _buildGroupedTasks(state),
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

  _buildGroupedTasks(GroupedTasksState state) {
    final groupedEntries = state.tasks.entries.toList();

    return CustomScrollView(
      slivers: [
        for (final entry in groupedEntries) ...[
          if (entry.value.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.black,
                child: Text(
                  entry.key.name,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TaskTile(task: entry.value[index]);
              },
              childCount: entry.value.length,
            ),
          ),
        ],
      ],
    );
  }

  _buildUngroupedTasks(UngroupedTasksState state) {
    return ListView.separated(
      itemCount: state.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: state.tasks[index]);
      },
      separatorBuilder: (context, index) => AppSpacers.v10px,
    );
  }
}
