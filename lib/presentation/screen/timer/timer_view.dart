import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/di/injection.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/snack_bar_helper.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';
import 'package:kanban_app/presentation/screen/timer/widgets/selected_task_placeholder.dart';
import 'package:kanban_app/presentation/screen/timer/widgets/time_track_task_picker_sheet.dart';
import 'package:kanban_app/presentation/screen/timer/widgets/timer_controls.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  Timer? _ticker;
  int _elapsedSeconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    context.read<TimeTrackCubit>().loadTasks();
    super.initState();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  void _startTimer(TaskEntity? selected) {
    if (selected == null) {
      SnackBarHelper.showInfo(context, 'Select a task first');
      return;
    }
    if (_isRunning) return;
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _elapsedSeconds += 1;
      });
      context.read<TimeTrackCubit>().updateDuration(_elapsedSeconds);
    });
    setState(() => _isRunning = true);
  }

  void _stopTimer() {
    _ticker?.cancel();
    setState(() => _isRunning = false);
  }

  void _endTimer(TaskEntity? selected) {
    if (selected == null) {
      SnackBarHelper.showInfo(context, 'Select a task first');
      return;
    }
    _ticker?.cancel();
    setState(() => _isRunning = false);
    context.read<TimeTrackCubit>().updateTaskDuration(
      taskId: selected.id,
      duration: _elapsedSeconds,
    );
  }

  void _openTaskPicker() {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (_) => const TimeTrackTaskPickerSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Time Track')),
      body: SafeArea(
        child: BlocListener<TimeTrackCubit, TimeTrackState>(
          listener: (context, state) {
            state.maybeWhen(
              initial: () {
                context.read<TimeTrackCubit>().loadTasks();
              },
              error: (msg) => SnackBarHelper.showError(context, msg),
              operationSuccess: (msg) =>
                  SnackBarHelper.showSuccess(context, msg),
              selectTask: (task) {
                _stopTimer();
                setState(() {
                  _elapsedSeconds = task.duration;
                  _isRunning = false;
                });
              },
              orElse: () {},
            );
          },
          child: BlocBuilder<TimeTrackCubit, TimeTrackState>(
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              final selectedTask = context.select<TimeTrackCubit, TaskEntity?>(
                (cubit) => cubit.selectedTask,
              );

              if (isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Time Track', style: theme.textTheme.headlineLarge),
                    const SizedBox(height: 16),
                    SelectedTaskPlaceholder(
                      task: selectedTask,
                      onSelect: _openTaskPicker,
                    ),
                    const SizedBox(height: 16),
                    TimerControls(
                      elapsedSeconds: _elapsedSeconds,
                      isRunning: _isRunning,
                      onStart: () => _startTimer(selectedTask),
                      onStop: _stopTimer,
                      onEnd: () => _endTimer(selectedTask),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
