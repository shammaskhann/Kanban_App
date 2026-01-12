import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  int totalTasks = 0;
  int toDoTasks = 0;
  int inProgressTasks = 0;
  int doneTasks = 0;
  List<TaskEntity> tasks = [];
  final GetTasks getTasks;

  HomeCubit(this.getTasks) : super(HomeState.initial());

  Future<void> fetchTasks() async {
    try {
      emit(HomeState.loading());
      final fetchedTasks = await getTasks.call();
      //only take recent 5
      tasks = fetchedTasks;
      totalTasks = tasks.length;
      doneTasks = tasks
          .where((task) => task.status == TaskStatus.done)
          .toList()
          .length;
      inProgressTasks = tasks
          .where((task) => task.status == TaskStatus.inProgress)
          .toList()
          .length;
      toDoTasks = tasks
          .where((task) => task.status == TaskStatus.todo)
          .toList()
          .length;
      emit(HomeState.taskLoaded(tasks.take(5).toList()));
      log('total tasks: $totalTasks');
    } catch (e) {
      emit(HomeState.error("An error occurred while fetching tasks."));
      log('Error fetching tasks: $e');
    }
  }
}
