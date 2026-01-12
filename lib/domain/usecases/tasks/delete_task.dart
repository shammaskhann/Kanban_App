import 'package:kanban_app/domain/irepositories/i_task_repository.dart';

class DeleteTask {
  final ITaskRepository repository;
  DeleteTask(this.repository);

  Future<void> call(String taskId) {
    return repository.deleteTask(taskId);
  }
}
