import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';

class CreateTask {
  final ITaskRepository repository;
  CreateTask(this.repository);

  Future<TaskEntity> call({
    required String content,
    int? duration,
    TaskStatus? status,
  }) {
    return repository.createTask(
      content: content,
      duration: duration,
      status: status,
    );
  }
}
