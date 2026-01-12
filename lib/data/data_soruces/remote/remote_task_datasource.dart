import 'package:kanban_app/data/model/task_model/task_model.dart';
import 'package:kanban_app/network/client/api_client.dart';
import 'package:kanban_app/network/constants/api_endpoints.dart';
import 'package:logger/logger.dart';

class RemoteTaskDatasource {
  final DioClient apiClient;
  final Logger logger;
  RemoteTaskDatasource({required this.apiClient, required this.logger});

  Future<List<TaskModel>> fetchTasks() async {
    try {
      final queryParams = <String, dynamic>{};
      final response = await apiClient.get(
        ApiEndpoints.tasks,
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );
      final list = (response as List).cast<Map<String, dynamic>>();
      logger.d('Fetched ${list.length} tasks from remote datasource');
      return list.map(TaskModel.fromJson).toList();
    } catch (e) {
      logger.e('Error DataSoruce fetching tasks: $e');
      rethrow;
    }
  }

  Future<TaskModel> createTask({required String content}) async {
    final payload = <String, dynamic>{'content': content};

    final response = await apiClient.post(ApiEndpoints.tasks, data: payload);

    final map = (response as Map).cast<String, dynamic>();
    return TaskModel.fromJson(map);
  }

  /// Update an existing task
  Future<TaskModel> updateTask({
    required String taskId,
    String? content,
  }) async {
    final payload = <String, dynamic>{if (content != null) 'content': content};

    final response = await apiClient.post(
      '${ApiEndpoints.tasks}/$taskId',
      data: payload,
    );
    final map = (response as Map).cast<String, dynamic>();
    return TaskModel.fromJson(map);
  }

  /// Delete a task
  Future<void> deleteTask(String taskId) async {
    await apiClient.delete('${ApiEndpoints.tasks}/$taskId');
  }
}
