import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';

class TimeTrackTaskPickerSheet extends StatefulWidget {
  const TimeTrackTaskPickerSheet({super.key});

  @override
  State<TimeTrackTaskPickerSheet> createState() => _TimeTrackTaskPickerSheetState();
}

class _TimeTrackTaskPickerSheetState extends State<TimeTrackTaskPickerSheet> {
  late PageController _pageController;
  int _currentPage = 0;
  final tabs = const ['To Do', 'In Progress'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = index);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TimeTrackCubit>();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    List<TaskEntity> tasksFor(int page) {
      if (page == 0) return cubit.toDoTasks;
      return cubit.inProgressTasks;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Select Task', style: theme.textTheme.titleLarge),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(tabs.length, (index) {
                final active = _currentPage == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(tabs[index]),
                    selected: active,
                    onSelected: (_) => _goToPage(index),
                    selectedColor: colorScheme.primary,
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: active
                          ? colorScheme.onPrimary
                          : theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) => setState(() => _currentPage = page),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final list = tasksFor(index);
                if (list.isEmpty) {
                  return Center(
                    child: Text(
                      'No tasks here',
                      style: theme.textTheme.bodyMedium,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final task = list[i];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: colorScheme.outlineVariant),
                      ),
                      title: Text(task.content),
                      subtitle: Text('Duration: ${task.duration}s'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      onTap: () {
                        context.read<TimeTrackCubit>().selectTask(task);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
