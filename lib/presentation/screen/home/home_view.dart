import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/presentation/screen/home/cubit/home_cubit.dart';
import 'package:kanban_app/presentation/screen/home/widgets/task_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: () {
            context.read<HomeCubit>().fetchTasks();
          },
          orElse: () {},
        );
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kanban App - Welcome User!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                // Add more UI components to display tasks
                // 4 summary cards for Total, To Do, In Progress, Done With Icons and Related Color
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: buildSummaryCard(
                        context,
                        'Total Tasks',
                        context.read<HomeCubit>().totalTasks,
                        Colors.blue,
                        Icons.list,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: buildSummaryCard(
                        context,
                        'To Do',
                        context.read<HomeCubit>().toDoTasks,
                        Colors.orange,
                        Icons.pending,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: buildSummaryCard(
                        context,
                        'In Progress',
                        context.read<HomeCubit>().inProgressTasks,
                        Colors.purple,
                        Icons.autorenew,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: buildSummaryCard(
                        context,
                        'Done',
                        context.read<HomeCubit>().doneTasks,
                        Colors.green,
                        Icons.check_circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Recent Tasks",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      taskLoaded: (tasks) {
                        return Expanded(
                          child: ListView.builder(
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              right: 5,
                              left: 5,
                            ),
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              final task = tasks[index];
                              return TaskCard(
                                context,
                                task,
                                showActions: false,
                              );
                            },
                          ),
                        );
                      },
                      loading: () => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      error: (message) => Center(child: Text(message)),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSummaryCard(
    BuildContext context,
    String title,
    int count,
    Color color,
    IconData icon,
  ) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
