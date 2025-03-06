import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_test_task/features/tasks/domain/entities/task_category.dart';
import 'package:space_scutum_test_task/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:space_scutum_test_task/features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:space_scutum_test_task/features/tasks/presentation/bloc/add_task_cubit/add_task_cubit.dart';
import 'package:space_scutum_test_task/shared/resources/app_constants.dart';
import 'package:space_scutum_test_task/shared/resources/app_paddings.dart';
import 'package:space_scutum_test_task/shared/resources/app_spacers.dart';
import 'package:space_scutum_test_task/shared/resources/app_strings.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AddTaskCubit(AddTaskUseCase(getIt<TasksRepository>()));
    return BlocBuilder<AddTaskCubit, AddTaskState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: AppPaddings.p20,
              child: Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: cubit.titleController,
                      onChanged: (value) {
                        cubit.updateTitle(value);
                      },
                      decoration: InputDecoration(
                        labelText: AppStrings.taskTitile,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.pleaseEnterTitle;
                        }
                        return null;
                      },
                    ),
                    AppSpacers.v10px,
                    TextFormField(
                      controller: cubit.descriptionController,
                      onChanged: (value) {
                        cubit.updateDescription(value);
                      },
                      decoration: InputDecoration(
                        labelText: AppStrings.taskDescription,
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.pleaseEnterDescription;
                        }
                        return null;
                      },
                    ),
                    AppSpacers.v10px,
                    SegmentedButton(
                      segments:
                          AppConstants.getCategoriesOptions(includeAll: false)
                              .map<ButtonSegment<TaskCategory>>(
                                  ((TaskCategory, String) filter) {
                        return ButtonSegment<TaskCategory>(
                          value: filter.$1,
                          label: Text(filter.$2),
                        );
                      }).toList(),
                      expandedInsets: EdgeInsets.zero,
                      selectedIcon: SizedBox.shrink(),
                      selected: {state.category},
                      onSelectionChanged: (category) {
                        cubit.selectCategory(category.first);
                      },
                    ),
                    AppSpacers.v10px,
                    ElevatedButton(
                      onPressed: () {
                        if (cubit.validateForm()) {
                          cubit.addTask();
                          context.pop();
                        }
                      },
                      child: Text(AppStrings.addTask),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
