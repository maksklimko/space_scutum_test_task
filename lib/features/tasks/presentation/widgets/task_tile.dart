import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:space_scutum_test_task/shared/resources/app_colors.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black12,
      child: Row(
        children: [
          Checkbox(
              value: task.isCompleted,
              onChanged: (val) {
                context.read<TasksBloc>().add(ToggleTaskCompletionEvent(task));
              }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                task.description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.black54),
              ),
            ],
          ),
          Spacer(),
          IconButton.filled(
            onPressed: () {
              context.read<TasksBloc>().add(DeleteTaskEvent(task.id));
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
