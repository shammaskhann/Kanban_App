import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/services/hive_service.dart';

class TaskEntity implements HiveModel {
  final String id;
  final String content;
  final TaskStatus status;
  final int commentCount;
  final String deadline;
  final String createdAt;
  final int duration;

  TaskEntity({
    required this.id,
    required this.content,
    required this.commentCount,
    this.status = TaskStatus.todo,
    required this.deadline,
    required this.createdAt,
    required this.duration,
  });

  @override
  String get primaryKey => id;

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'status': status.name,
    'comment_count': commentCount,
    'deadline': deadline,
    'created_at': createdAt,
    'duration': duration,
  };

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
    id: json['id'] as String,
    content: json['content'] as String,
    commentCount: json['comment_count'] as int,
    status: TaskStatus.values.byName(json['status'] as String? ?? 'todo'),
    deadline: json['deadline'] as String? ?? '',
    createdAt: json['created_at'] as String,
    duration: json['duration'] as int? ?? 0,
  );

  //copy With
  TaskEntity copyWith({
    String? id,
    String? content,
    TaskStatus? status,
    int? commentCount,
    String? deadline,
    String? createdAt,
    int? duration,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      content: content ?? this.content,
      status: status ?? this.status,
      commentCount: commentCount ?? this.commentCount,
      deadline: deadline ?? this.deadline,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
    );
  }
}
