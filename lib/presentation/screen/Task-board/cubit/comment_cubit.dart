import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/domain/usecases/comments/create_comment.dart';
import 'package:kanban_app/domain/usecases/comments/get_comments.dart';

part 'comment_cubit.freezed.dart';
part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final GetComments getCommentsUseCase;
  final CreateComment createCommentUseCase;

  List<CommentEntity> comments = [];
  String currentTaskId = '';

  CommentCubit({
    required this.getCommentsUseCase,
    required this.createCommentUseCase,
  }) : super(const CommentState.initial());

  /// Load comments for a specific task
  Future<void> loadComments(String taskId) async {
    emit(const CommentState.loading());
    try {
      currentTaskId = taskId;
      comments = await getCommentsUseCase.call(taskId);
      emit(CommentState.loaded(comments));
    } catch (e) {
      emit(CommentState.error('Failed to load comments: ${e.toString()}'));
    }
  }

  /// Create a new comment
  Future<void> addComment(String content) async {
    if (currentTaskId.isEmpty) {
      emit(CommentState.error('No task selected'));
      return;
    }

    try {
      emit(const CommentState.creatingComment());
      final newComment = await createCommentUseCase.call(
        taskId: currentTaskId,
        content: content,
      );
      comments = [newComment, ...comments];
      emit(CommentState.commentCreated(newComment));
      emit(CommentState.loaded(comments));
    } catch (e) {
      emit(CommentState.error('Failed to add comment: ${e.toString()}'));
      // Return to loaded state after error
      if (comments.isNotEmpty) {
        emit(CommentState.loaded(comments));
      }
    }
  }

  /// Clear comments when closing bottom sheet
  void clearComments() {
    comments = [];
    currentTaskId = '';
    emit(const CommentState.initial());
  }
}
