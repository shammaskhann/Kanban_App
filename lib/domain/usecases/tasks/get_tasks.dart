import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';

class GetTasks {
  final ITaskRepository repository;
  GetTasks(this.repository);

  Future<List<TaskEntity>> call() {
    return repository.fetchAllTasks();
  }
}
