import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/domain/irepositories/i_comment_repository.dart';

class CreateComment {
  final ICommentRepository repository;

  CreateComment(this.repository);

  Future<CommentEntity> call({
    required String taskId,
    required String content,
  }) async {
    return await repository.createComment(
      taskId: taskId,
      content: content,
    );
  }
}
