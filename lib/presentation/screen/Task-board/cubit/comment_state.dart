part of 'comment_cubit.dart';

@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = _Initial;
  const factory CommentState.loading() = _Loading;
  const factory CommentState.creatingComment() = _CreatingComment;
  const factory CommentState.loaded(List<CommentEntity> comments) = _Loaded;
  const factory CommentState.commentCreated(CommentEntity comment) =
      _CommentCreated;
  const factory CommentState.error(String message) = _Error;
}
