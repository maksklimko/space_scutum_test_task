part of 'tasks_bloc.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoaded extends TasksState {
  final List<Task> tasks;
  TasksLoaded(this.tasks);
}
