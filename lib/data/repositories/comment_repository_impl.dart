import 'package:kanban_app/data/data_soruces/remote/remote_comment_datasource.dart';
import 'package:kanban_app/data/model/comment_model/comment_model.dart';
import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/domain/irepositories/i_comment_repository.dart';

class CommentRepositoryImpl implements ICommentRepository {
  final RemoteCommentDatasource remoteCommentDatasource;

  CommentRepositoryImpl({required this.remoteCommentDatasource});

  @override
  Future<List<CommentEntity>> getCommentsByTaskId(String taskId) async {
    try {
      final remoteComments = await remoteCommentDatasource
          .fetchCommentsByTaskId(taskId);
      return remoteComments.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommentEntity> createComment({
    required String taskId,
    required String content,
  }) async {
    try {
      final remoteComment = await remoteCommentDatasource.createComment(
        taskId: taskId,
        content: content,
      );
      return remoteComment.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
