import 'package:kanban_app/data/model/comment_model/comment_model.dart';
import 'package:kanban_app/network/client/api_client.dart';
import 'package:kanban_app/network/constants/api_endpoints.dart';
import 'package:logger/logger.dart';

class RemoteCommentDatasource {
  final DioClient apiClient;
  final Logger logger;

  RemoteCommentDatasource({required this.apiClient, required this.logger});

  /// Get all comments for a specific task
  Future<List<CommentModel>> fetchCommentsByTaskId(String taskId) async {
    try {
      final queryParams = <String, dynamic>{'task_id': taskId};
      final response = await apiClient.get(
        '${ApiEndpoints.comments}',
        queryParameters: queryParams,
      );
      final list = (response as List).cast<Map<String, dynamic>>();
      logger.d('Fetched ${list.length} comments for task $taskId');
      return list.map(CommentModel.fromJson).toList();
    } catch (e) {
      logger.e('Error fetching comments for task $taskId: $e');
      rethrow;
    }
  }

  /// Create a new comment on a task
  Future<CommentModel> createComment({
    required String taskId,
    required String content,
  }) async {
    try {
      final payload = <String, dynamic>{'task_id': taskId, 'content': content};

      final response = await apiClient.post(
        ApiEndpoints.comments,
        data: payload,
      );

      final map = (response as Map).cast<String, dynamic>();
      logger.d('Created comment on task $taskId');
      return CommentModel.fromJson(map);
    } catch (e) {
      logger.e('Error creating comment on task $taskId: $e');
      rethrow;
    }
  }
}
