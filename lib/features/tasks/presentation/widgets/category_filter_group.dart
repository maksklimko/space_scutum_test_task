import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:space_scutum_test_task/shared/resources/app_colors.dart';

/// Widget that displays a group of category filter buttons
/// allowing users to filter tasks by category
class CategoryFilterGroup extends StatelessWidget {
  const CategoryFilterGroup({super.key, this.selectedCategory});

  /// Selected category
  final TaskCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: TaskCategory.values.map((e) {
        return GestureDetector(
          onTap: () {
            context.read<TasksBloc>().add(SelectFilterCategory(e));
          },
          child: Container(
            color: e == selectedCategory ? AppColors.black : AppColors.black12,
            child: Text(e.name),
          ),
        );
      }).toList(),
    );
  }
}
