import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> fetchAllTasks();

  Future<TaskEntity> createTask({
    required String content,
    TaskStatus? status,
    int? duration,
  });

  Future<void> updateTask({
    required String taskId,
    String? content,
    TaskStatus? status,
    int? duration,
  });

  Future<void> deleteTask(String taskId);
}
