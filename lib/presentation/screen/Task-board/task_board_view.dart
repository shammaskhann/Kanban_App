import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/comment_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/add_task_sheet.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/comments_bottom_sheet.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/delete_confirmation_sheet.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/loading_overlay.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/snack_bar_helper.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/update_task_sheet.dart';
import 'package:kanban_app/presentation/screen/home/widgets/task_card.dart';

class TaskBoardView extends StatefulWidget {
  const TaskBoardView({super.key});

  @override
  State<TaskBoardView> createState() => _TaskBoardViewState();
}

class _TaskBoardViewState extends State<TaskBoardView> {
  late PageController _pageController;
  final List<String> TASK_COL = ['To Do', 'In Progress', 'Done'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Load tasks once when the view initializes
    context.read<TaskBoardCubit>().loadTasks();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    context.read<TaskBoardCubit>().changeView(page);
  }

  void _showAddTaskSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const AddTaskSheet(),
    ).then((_) {
      // Ensure tasks reload after closing the add task sheet
      context.read<TaskBoardCubit>().loadTasks();
    });
  }

  void _showEditTaskSheet(TaskEntity task) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => UpdateTaskSheet(task: task),
    );
  }

  void _showDeleteConfirmation(TaskEntity task) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (ctx) =>
          DeleteConfirmationSheet(taskId: task.id, taskName: task.content),
    );
  }

  void _showCommentsSheet(TaskEntity task) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => BlocProvider<CommentCubit>.value(
        value: context.read<CommentCubit>(),
        child: CommentsBottomSheet(taskId: task.id, taskTitle: task.content),
      ),
    ).then((_) {
      // Reload tasks when comments sheet is closed
      context.read<TaskBoardCubit>().loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //Add Task Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        onPressed: _showAddTaskSheet,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<TaskBoardCubit, TaskBoardState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return LoadingOverlay(
              isLoading: isLoading,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TASK BOARD',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20),
                    // Column Navigation Tabs
                    BlocBuilder<TaskBoardCubit, TaskBoardState>(
                      builder: (context, state) {
                        final currentIndex = context.select(
                          (TaskBoardCubit cubit) => cubit.currentIndex,
                        );
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(TASK_COL.length, (index) {
                              final isActive = currentIndex == index;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: GestureDetector(
                                  onTap: () => _goToPage(index),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Text(
                                      TASK_COL[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: isActive
                                                ? Colors.white
                                                : Theme.of(
                                                    context,
                                                  ).textTheme.bodyMedium?.color,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // PAGE VIEW FOR COLUMNS
                    Expanded(
                      child: BlocConsumer<TaskBoardCubit, TaskBoardState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            changeIndex: (index) {
                              log('Changing to page $index');
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeInOut,
                              );
                            },
                            operationSuccess: (message) {
                              SnackBarHelper.showSuccess(context, message);
                            },
                            error: (message) {
                              SnackBarHelper.showError(context, message);
                            },
                            orElse: () {},
                          );
                        },
                        builder: (context, state) {
                          return PageView.builder(
                            controller: _pageController,
                            onPageChanged: (page) {
                              _goToPage(page);
                            },
                            itemCount: TASK_COL.length,
                            itemBuilder: (context, index) {
                              final cubit = context.read<TaskBoardCubit>();
                              List<TaskEntity> tasksForColumn;
                              switch (index) {
                                case 0:
                                  tasksForColumn = cubit.toDoTasks;
                                  break;
                                case 1:
                                  tasksForColumn = cubit.inProgressTasks;
                                  break;
                                case 2:
                                  tasksForColumn = cubit.doneTasks;
                                  break;
                                default:
                                  tasksForColumn = const [];
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  // Tasks List
                                  Expanded(
                                    child:
                                        tasksForColumn.isEmpty &&
                                            (isLoading == false)
                                        ? Center(
                                            child: Text(
                                              'No tasks',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                            ),
                                          )
                                        : ListView.builder(
                                            itemCount: tasksForColumn.length,
                                            itemBuilder: (context, taskIndex) {
                                              final task =
                                                  tasksForColumn[taskIndex];
                                              return TaskCard(
                                                context,
                                                task,
                                                onEdit: () =>
                                                    _showEditTaskSheet(task),
                                                onDelete: () =>
                                                    _showDeleteConfirmation(
                                                      task,
                                                    ),
                                                onComments: () =>
                                                    _showCommentsSheet(task),
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
