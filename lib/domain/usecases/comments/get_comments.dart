import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/domain/irepositories/i_comment_repository.dart';

class GetComments {
  final ICommentRepository repository;

  GetComments(this.repository);

  Future<List<CommentEntity>> call(String taskId) async {
    return await repository.getCommentsByTaskId(taskId);
  }
}
