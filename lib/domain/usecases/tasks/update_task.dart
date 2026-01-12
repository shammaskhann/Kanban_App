import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';

class UpdateTask {
  final ITaskRepository repository;
  UpdateTask(this.repository);

  Future<void> call({
    required String taskId,
    String? content,
    TaskStatus? status,
    int? duration,
  }) {
    return repository.updateTask(
      taskId: taskId,
      content: content,
      status: status,
      duration: duration,
    );
  }
}
