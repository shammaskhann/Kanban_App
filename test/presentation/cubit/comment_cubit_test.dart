import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/domain/usecases/comments/create_comment.dart';
import 'package:kanban_app/domain/usecases/comments/get_comments.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/comment_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_board_cubit_test.mocks.dart';

@GenerateMocks([GetComments, CreateComment])
void main() {
  late MockGetComments mockGetComments;
  late MockCreateComment mockCreateComment;
  late CommentCubit commentCubit;

  setUp(() {
    mockGetComments = MockGetComments();
    mockCreateComment = MockCreateComment();
    commentCubit = CommentCubit(
      getCommentsUseCase: mockGetComments,
      createCommentUseCase: mockCreateComment,
    );
  });

  tearDown(() {
    commentCubit.close();
  });

  group('CommentCubit', () {
    test('initial state is CommentState.initial', () {
      expect(commentCubit.state, const CommentState.initial());
    });

    group('loadComments', () {
      const taskId = 'task-123';
      final mockComments = [
        CommentEntity(
          id: '1',
          taskId: taskId,
          content: 'Great task!',
          postedAt: DateTime.now().toIso8601String(),
        ),
        CommentEntity(
          id: '2',
          taskId: taskId,
          content: 'Need help with this',
          postedAt: DateTime.now().toIso8601String(),
        ),
      ];

      blocTest<CommentCubit, CommentState>(
        'emits [loading, loaded] when loadComments is successful',
        build: () {
          when(
            mockGetComments.call(taskId),
          ).thenAnswer((_) async => mockComments);
          return commentCubit;
        },
        act: (cubit) => cubit.loadComments(taskId),
        expect: () => [
          const CommentState.loading(),
          CommentState.loaded(mockComments),
        ],
      );

      blocTest<CommentCubit, CommentState>(
        'emits [loading, error] when loadComments fails',
        build: () {
          when(
            mockGetComments.call(taskId),
          ).thenThrow(Exception('Network error'));
          return commentCubit;
        },
        act: (cubit) => cubit.loadComments(taskId),
        expect: () => [
          const CommentState.loading(),
          isA<CommentState>().having(
            (state) => state.maybeWhen(
              error: (msg) => msg.contains('Network error'),
              orElse: () => false,
            ),
            'error message',
            true,
          ),
        ],
      );
    });

    group('addComment', () {
      const taskId = 'task-123';
      const content = 'This is a comment';
      final newComment = CommentEntity(
        id: 'comment-456',
        taskId: taskId,
        content: content,
        postedAt: DateTime.now().toIso8601String(),
      );

      blocTest<CommentCubit, CommentState>(
        'emits [creatingComment, commentCreated, loaded] when addComment succeeds',
        build: () {
          when(mockGetComments.call(taskId)).thenAnswer((_) async => []);
          when(
            mockCreateComment.call(taskId: taskId, content: content),
          ).thenAnswer((_) async => newComment);
          return commentCubit;
        },
        act: (cubit) async {
          await cubit.loadComments(taskId);
          await cubit.addComment(content);
        },
        expect: () => [
          const CommentState.loading(),
          CommentState.loaded([]),
          const CommentState.creatingComment(),
          CommentState.commentCreated(newComment),
          CommentState.loaded([newComment]),
        ],
      );

      blocTest<CommentCubit, CommentState>(
        'emits error when addComment fails',
        build: () {
          when(mockGetComments.call(taskId)).thenAnswer((_) async => []);
          when(
            mockCreateComment.call(taskId: taskId, content: content),
          ).thenThrow(Exception('Failed to create comment'));
          return commentCubit;
        },
        act: (cubit) async {
          await cubit.loadComments(taskId);
          await cubit.addComment(content);
        },
        expect: () => [
          const CommentState.loading(),
          CommentState.loaded([]),
          const CommentState.creatingComment(),
          isA<CommentState>().having(
            (state) => state.maybeWhen(
              error: (msg) => msg.contains('Failed to create comment'),
              orElse: () => false,
            ),
            'error message',
            true,
          ),
        ],
      );
    });

    group('clearComments', () {
      blocTest<CommentCubit, CommentState>(
        'resets state to initial',
        build: () => commentCubit,
        act: (cubit) => cubit.clearComments(),
        expect: () => [const CommentState.initial()],
      );
    });
  });
}
