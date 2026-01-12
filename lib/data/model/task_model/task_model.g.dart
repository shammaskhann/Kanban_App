// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: json['id'] as String,
  content: json['content'] as String,
  duration: (json['duration'] as num?)?.toInt() ?? 0,
  commentCount: (json['comment_count'] as num).toInt(),
  deadline: json['deadline'] == null
      ? null
      : TaskDeadlineDto.fromJson(json['deadline'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'duration': instance.duration,
      'comment_count': instance.commentCount,
      'deadline': instance.deadline,
      'created_at': instance.createdAt,
    };

_TaskDeadlineDto _$TaskDeadlineDtoFromJson(Map<String, dynamic> json) =>
    _TaskDeadlineDto(date: json['date'] as String?);

Map<String, dynamic> _$TaskDeadlineDtoToJson(_TaskDeadlineDto instance) =>
    <String, dynamic>{'date': instance.date};
