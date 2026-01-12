import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/usecases/comments/create_comment.dart';
import 'package:kanban_app/domain/usecases/comments/get_comments.dart';
import 'package:kanban_app/domain/usecases/tasks/create_task.dart';
import 'package:kanban_app/domain/usecases/tasks/delete_task.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';

part 'task_board_state.dart';
part 'task_board_cubit.freezed.dart';

class TaskBoardCubit extends Cubit<TaskBoardState> {
  int currentIndex = 0;
  final GetTasks getTasksUseCase;
  final CreateTask addTaskUseCase;
  final UpdateTask updateTaskUseCase;
  final DeleteTask deleteTaskUseCase;

  final GetComments getCommentsUseCase;
  final CreateComment addCommentUseCase;

  List<TaskEntity> toDoTasks = [];
  List<TaskEntity> inProgressTasks = [];
  List<TaskEntity> doneTasks = [];
  TaskBoardCubit(
    this.getTasksUseCase,
    this.addTaskUseCase,
    this.updateTaskUseCase,
    this.deleteTaskUseCase,
    this.getCommentsUseCase,
    this.addCommentUseCase,
  ) : super(TaskBoardState.initial());

  void changeView(int index) {
    currentIndex = index;
    emit(TaskBoardState.changeIndex(index));
  }

  Future<void> loadTasks() async {
    emit(const TaskBoardState.loading());
    try {
      final tasks = await getTasksUseCase.call();
      toDoTasks = tasks.where((t) => t.status == TaskStatus.todo).toList();
      inProgressTasks = tasks
          .where((t) => t.status == TaskStatus.inProgress)
          .toList();
      doneTasks = tasks.where((t) => t.status == TaskStatus.done).toList();
      _emitLoaded();
    } catch (e) {
      emit(TaskBoardState.error('Failed to load tasks'));
    }
  }

  Future<void> addTask({
    required String content,
    String? dueString,
    int? duration,
    required TaskStatus status,
  }) async {
    emit(const TaskBoardState.loading());
    try {
      final created = await addTaskUseCase.call(
        content: content,
        status: status,
        duration: duration,
      );
      _placeInBucket(created);
      _emitLoaded();
      emit(const TaskBoardState.operationSuccess('Task added'));
    } catch (e) {
      emit(TaskBoardState.error('Failed to add task'));
    }
  }

  Future<void> updateTask({
    required String taskId,
    String? content,
    int? duration,
    required TaskStatus status,
  }) async {
    emit(const TaskBoardState.loading());
    try {
      await updateTaskUseCase.call(
        taskId: taskId,
        content: content,
        status: status,
        duration: duration,
      );
      if (status == TaskStatus.done) {
        await completeTask(taskId);
      } else if (status == TaskStatus.todo) {
        final task = _removeFromAll(taskId);
        if (task != null) {
          final updated = TaskEntity(
            id: task.id,
            content: task.content,
            commentCount: task.commentCount,
            status: TaskStatus.todo,
            deadline: task.deadline,
            createdAt: task.createdAt,
            duration: task.duration,
          );
          toDoTasks.add(updated);
        }
      } else {
        _moveToInProgress(taskId);
      }
      _emitLoaded();
      emit(const TaskBoardState.operationSuccess('Task updated'));
    } catch (e) {
      emit(TaskBoardState.error('Failed to update task'));
    }
  }

  Future<void> deleteTask(String taskId) async {
    emit(const TaskBoardState.loading());
    try {
      await deleteTaskUseCase.call(taskId);
      toDoTasks.removeWhere((t) => t.id == taskId);
      inProgressTasks.removeWhere((t) => t.id == taskId);
      doneTasks.removeWhere((t) => t.id == taskId);
      _emitLoaded();
      emit(const TaskBoardState.operationSuccess('Task deleted'));
    } catch (e) {
      emit(TaskBoardState.error('Failed to delete task'));
    }
  }

  Future<void> completeTask(String taskId) async {
    try {
      await updateTaskUseCase.call(taskId: taskId, status: TaskStatus.done);
      final task = _removeFromAll(taskId);
      if (task != null) {
        final updated = TaskEntity(
          id: task.id,
          content: task.content,
          commentCount: task.commentCount,
          status: TaskStatus.done,
          deadline: task.deadline,
          createdAt: task.createdAt,
          duration: task.duration,
        );
        doneTasks.add(updated);
      }
    } catch (_) {}
  }

  void _moveToInProgress(String taskId) {
    final task = _removeFromAll(taskId);
    if (task != null) {
      final updated = TaskEntity(
        id: task.id,
        content: task.content,
        commentCount: task.commentCount,
        status: TaskStatus.inProgress,
        deadline: task.deadline,
        createdAt: task.createdAt,
        duration: task.duration,
      );
      inProgressTasks.add(updated);
    }
  }

  TaskEntity? _removeFromAll(String taskId) {
    TaskEntity? found;
    final idxTodo = toDoTasks.indexWhere((t) => t.id == taskId);
    if (idxTodo != -1) found = toDoTasks.removeAt(idxTodo);
    final idxProg = inProgressTasks.indexWhere((t) => t.id == taskId);
    if (idxProg != -1) found = inProgressTasks.removeAt(idxProg);
    final idxDone = doneTasks.indexWhere((t) => t.id == taskId);
    if (idxDone != -1) found = doneTasks.removeAt(idxDone);
    return found;
  }

  void _placeInBucket(TaskEntity task) {
    if (task.status == TaskStatus.todo) {
      toDoTasks.add(task);
    } else if (task.status == TaskStatus.inProgress) {
      inProgressTasks.add(task);
    } else {
      doneTasks.add(task);
    }
  }

  void _emitLoaded() {
    emit(
      TaskBoardState.loaded(
        toDo: List.unmodifiable(toDoTasks),
        inProgress: List.unmodifiable(inProgressTasks),
        done: List.unmodifiable(doneTasks),
      ),
    );
  }
}
