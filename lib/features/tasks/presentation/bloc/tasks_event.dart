part of 'tasks_bloc.dart';

abstract class TasksEvent {}

class GetTasksEvent extends TasksEvent {}

class AddTaskEvent extends TasksEvent {
  final Task task;
  AddTaskEvent(this.task);
}

class ToggleTaskCompletionEvent extends TasksEvent {
  final Task task;
  ToggleTaskCompletionEvent(this.task);
}

class DeleteTaskEvent extends TasksEvent {
  final int id;
  DeleteTaskEvent(this.id);
}

class ToggleIsGrouped extends TasksEvent {
  ToggleIsGrouped();
}

class SelectFilterCategory extends TasksEvent {
  final TaskCategory category;
  SelectFilterCategory(this.category);
}
