import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title),
          Text(task.description),
        ],
      ),
    );
  }
}
