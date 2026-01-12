import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';

part 'time_track_state.dart';
part 'time_track_cubit.freezed.dart';

class TimeTrackCubit extends Cubit<TimeTrackState> {
  int currentIndex = 0;
  int timeDuration = 0;
  TaskEntity? selectedTask = null;
  final GetTasks getTasksUseCase;
  final UpdateTask updateTaskUseCase;

  List<TaskEntity> toDoTasks = [];
  var inProgressTasks = <TaskEntity>[];

  TimeTrackCubit(this.getTasksUseCase, this.updateTaskUseCase)
    : super(TimeTrackState.initial());

  void selectTask(TaskEntity task) {
    selectedTask = task;
    emit(TimeTrackState.selectTask(task));
  }

  void changeViewOfList(int index) {
    currentIndex = index;
    emit(TimeTrackState.changeIndex(index));
  }

  Future<void> loadTasks() async {
    emit(const TimeTrackState.loading());
    try {
      final tasks = await getTasksUseCase.call();
      toDoTasks = tasks.where((t) => t.status == TaskStatus.todo).toList();
      inProgressTasks = tasks
          .where((t) => t.status == TaskStatus.inProgress)
          .toList();
      // doneTasks = tasks.where((t) => t.status == TaskStatus.done).toList();
      _emitLoaded();
    } catch (e) {
      emit(TimeTrackState.error('Failed to load tasks'));
    }
  }

  void updateDuration(int duration) {
    timeDuration = duration;
    emit(TimeTrackState.updateDurantion(duration));
  }

  Future<void> updateTaskDuration({
    required String taskId,
    required int duration,
  }) async {
    try {
      await updateTaskUseCase.call(taskId: taskId, duration: duration);
      emit(
        TimeTrackState.operationSuccess('Task duration updated successfully'),
      );
    } catch (e) {
      emit(TimeTrackState.error('Failed to update task duration'));
    }
  }

  void _emitLoaded() {
    emit(
      TimeTrackState.loaded(
        toDo: List.unmodifiable(toDoTasks),
        inProgress: List.unmodifiable(inProgressTasks),
      ),
    );
  }
}
