// lib/data/model/comment_model/comment_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/entities/comments/comment_entity.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'task_id') required String taskId,
    required String content,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'posted_at') required String postedAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

// Mapper to domain
extension CommentModelX on CommentModel {
  CommentEntity toEntity() => CommentEntity(
    id: id,
    taskId: taskId,
    content: content,
    postedAt: postedAt,
  );
}
