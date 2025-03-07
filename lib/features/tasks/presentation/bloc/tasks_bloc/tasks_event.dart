part of 'tasks_bloc.dart';

/// Base class for all task-related events in TasksBloc
abstract class TasksEvent {}

/// Event for fetching tasks from the repository
class GetTasksEvent extends TasksEvent {}

/// Event for toggling the completion status of a [task]
class ToggleTaskCompletionEvent extends TasksEvent {
  final Task task;
  ToggleTaskCompletionEvent(this.task);
}

/// Event for deleting a task from the repository by [id]
class DeleteTaskEvent extends TasksEvent {
  final int id;
  DeleteTaskEvent(this.id);
}

/// Event for toggling the grouping status of tasks
class ToggleIsGrouped extends TasksEvent {
  ToggleIsGrouped();
}

/// Event for selecting a filter [category]
class SelectFilterCategory extends TasksEvent {
  final TaskCategory category;
  SelectFilterCategory(this.category);
}
