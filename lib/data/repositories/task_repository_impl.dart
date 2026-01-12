import 'dart:developer';

import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/data/data_soruces/remote/remote_task_datasource.dart';
import 'package:kanban_app/data/model/task_model/task_model.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';

class TaskRepositoryImpl extends ITaskRepository {
  final RemoteTaskDatasource remoteTaskDatasource;
  final LocalDataSource localDataSource;
  TaskRepositoryImpl({
    required this.remoteTaskDatasource,
    required this.localDataSource,
  });

  @override
  Future<List<TaskEntity>> fetchAllTasks() async {
    try {
      final models = await remoteTaskDatasource.fetchTasks();
      final localFetchTask = await localDataSource.getTasks();
      final modifiedTask = models
          .map(
            (m) => m.toTaskEntity(
              localFetchTask
                  .firstWhere(
                    (localTask) => localTask.id == m.id,
                    orElse: () => TaskEntity(
                      id: m.id,
                      content: m.content,
                      commentCount: m.commentCount,
                      duration: m.duration ?? 0,
                      status: TaskStatus.todo,
                      deadline: m.deadline?.date ?? '',
                      createdAt: m.createdAt,
                    ),
                  )
                  .status,
              localFetchTask
                  .firstWhere(
                    (localTask) => localTask.id == m.id,
                    orElse: () => TaskEntity(
                      id: m.id,
                      content: m.content,
                      commentCount: m.commentCount,
                      duration: m.duration ?? 0,
                      status: TaskStatus.todo,
                      deadline: m.deadline?.date ?? '',
                      createdAt: m.createdAt,
                    ),
                  )
                  .duration,
            ),
          )
          .toList();
      return modifiedTask;
    } catch (e) {
      log('Error in fetching tasks: $e');
      rethrow;
    }
  }

  @override
  Future<TaskEntity> createTask({
    required String content,
    String? dueString,
    TaskStatus? status,
    int? duration,
  }) async {
    final model = await remoteTaskDatasource.createTask(content: content);
    await localDataSource.addTask(
      model.toTaskEntity(status ?? TaskStatus.todo, duration ?? 0),
    );
    return model.toEntity();
  }

  @override
  Future<void> updateTask({
    required String taskId,
    String? content,
    TaskStatus? status,
    int? duration,
  }) async {
    try {
      if (content != null) {
        await remoteTaskDatasource.updateTask(taskId: taskId, content: content);
      }
      await localDataSource.updateTask(
        taskId,
        status: status,
        duration: duration,
        content: content,
      );
    } catch (e) {
      log('Error updating task in repository: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await remoteTaskDatasource.deleteTask(taskId);
    await localDataSource.deleteTask(taskId);
  }
}
