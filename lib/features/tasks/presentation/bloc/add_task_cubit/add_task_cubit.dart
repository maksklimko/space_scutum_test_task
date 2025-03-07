import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/add_task_usecase.dart';

part 'add_task_state.dart';

/// Cubit for adding a new task
class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._addTaskUseCase) : super(AddTaskInitial());

  /// Usecase for adding a new task
  final AddTaskUseCase _addTaskUseCase;

  /// Form key for the add task form
  final _formKey = GlobalKey<FormState>();

  /// Title controller for the add task form
  final _titleController = TextEditingController();

  /// Description controller for the add task form
  final _descriptionController = TextEditingController();

  /// Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get titleController => _titleController;
  TextEditingController get descriptionController => _descriptionController;

  // Update title and description
  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description));
  }

  // Validate form fields
  bool validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  // Reset the form
  void resetForm() {
    _formKey.currentState?.reset();
    _titleController.clear();
    _descriptionController.clear();
    emit(AddTaskInitial());
  }

  /// Selects a category for the task
  void selectCategory(TaskCategory category) {
    emit(state.copyWith(category: category));
  }

  /// Adds a new task to the repository
  void addTask() async {
    await _addTaskUseCase.call(
      Task(
        id: DateTime.now().millisecondsSinceEpoch,
        title: state.title,
        description: state.description,
        isCompleted: false,
        category: state.category,
      ),
    );
  }

  /// Disposes of the controllers
  @override
  Future<void> close() {
    _titleController.dispose();
    _descriptionController.dispose();
    return super.close();
  }
}
