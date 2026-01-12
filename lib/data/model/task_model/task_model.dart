// lib/data/model/task_model/task_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task.depreciated.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String content,
    @JsonKey(name: 'duration') @Default(0) int? duration,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'deadline') required TaskDeadlineDto? deadline,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

@freezed
abstract class TaskDeadlineDto with _$TaskDeadlineDto {
  const factory TaskDeadlineDto({String? date}) = _TaskDeadlineDto;
  factory TaskDeadlineDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDeadlineDtoFromJson(json);
}

// Mapper to domain
extension TaskModelX on TaskModel {
  TaskEntity toEntity() => TaskEntity(
    id: id,
    content: content,
    commentCount: commentCount,
    duration: duration ?? 0,
    deadline: deadline?.date ?? '',
    createdAt: createdAt,
  );

  TaskEntity toTaskEntity(TaskStatus status, int duration) {
    return TaskEntity(
      id: id,
      content: content,
      duration: duration ?? 0,
      commentCount: commentCount,
      status: status,
      deadline: deadline?.date ?? '',
      createdAt: createdAt,
    );
  }
}
