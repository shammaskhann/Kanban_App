import 'package:kanban_app/domain/entities/comments/comment_entity.dart';

abstract class ICommentRepository {
  /// Get all comments for a specific task
  Future<List<CommentEntity>> getCommentsByTaskId(String taskId);

  /// Create a new comment on a task
  Future<CommentEntity> createComment({
    required String taskId,
    required String content,
  });
}
