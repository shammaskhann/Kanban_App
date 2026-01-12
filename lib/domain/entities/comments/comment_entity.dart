import 'package:kanban_app/services/hive_service.dart';

class CommentEntity implements HiveModel {
  final String id;
  final String taskId;
  final String content;
  final String postedAt;

  CommentEntity({
    required this.id,
    required this.taskId,
    required this.content,
    required this.postedAt,
  });

  @override
  String get primaryKey => id;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'task_id': taskId,
    'content': content,
    'posted_at': postedAt,
  };

  factory CommentEntity.fromJson(Map<String, dynamic> json) => CommentEntity(
    id: json['id'] as String,
    taskId: json['task_id'] as String,
    content: json['content'] as String,
    postedAt: json['posted_at'] as String,
  );

  // Copy with
  CommentEntity copyWith({
    String? id,
    String? taskId,
    String? content,
    String? postedAt,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      content: content ?? this.content,
      postedAt: postedAt ?? this.postedAt,
    );
  }
}
