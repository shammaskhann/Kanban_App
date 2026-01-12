import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/presentation/screen/Task-board/task_board_view.dart';
import 'package:kanban_app/presentation/screen/dashboard/cubit/dashboard_cubit.dart';
import 'package:kanban_app/presentation/screen/dashboard/widget/navbar.dart';
import 'package:kanban_app/presentation/screen/settings/settings_view.dart';
import 'package:kanban_app/presentation/screen/timer/cubit/time_track_cubit.dart';
import 'package:kanban_app/presentation/screen/timer/timer_view.dart';
import 'package:kanban_app/presentation/screen/home/cubit/home_cubit.dart';

import '../home/home_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> views = [
      const HomeView(),
      const TimerView(),
      const TaskBoardView(),
      const SettingsView(),
    ];

    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        state.maybeWhen(
          changeView: (index) {
            // Reload HomeView data when navigating to it
            if (index == 0) {
              context.read<HomeCubit>().fetchTasks();
            } else if (index == 1) {
              context.read<TimeTrackCubit>().loadTasks();
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final currentIndex = state.when(
          initial: () => 0,
          changeView: (index) => index,
          error: (_) => 0,
        );

        return Scaffold(
          body: views[currentIndex],
          bottomNavigationBar: BottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              // This integrates perfectly with your existing Cubit logic
              context.read<DashboardCubit>().changeView(index);
            },
          ),
        );
      },
    );
  }
}
