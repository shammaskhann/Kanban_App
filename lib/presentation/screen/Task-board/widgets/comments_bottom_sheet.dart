import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/domain/entities/comments/comment_entity.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/comment_cubit.dart';
import 'package:kanban_app/presentation/screen/Task-board/widgets/snack_bar_helper.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String taskId;
  final String taskTitle;

  const CommentsBottomSheet({
    super.key,
    required this.taskId,
    required this.taskTitle,
  });

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  late TextEditingController _commentController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _scrollController = ScrollController();
    // Load comments when sheet opens
    context.read<CommentCubit>().loadComments(widget.taskId);
  }

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleAddComment() {
    final content = _commentController.text.trim();
    if (content.isEmpty) {
      SnackBarHelper.showInfo(context, 'Comment cannot be empty');
      return;
    }
    log('Adding comment: $content');
    context.read<CommentCubit>().addComment(content);
    _commentController.clear();

    // Auto scroll to top to show new comment
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comments',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.taskTitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                  ],
                ),
              ),

              // Comments List
              Expanded(
                child: BlocListener<CommentCubit, CommentState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      error: (msg) => SnackBarHelper.showError(context, msg),
                      commentCreated: (_) =>
                          SnackBarHelper.showSuccess(context, 'Comment added'),
                      orElse: () {},
                    );
                  },
                  child: BlocBuilder<CommentCubit, CommentState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        // Loading state
                        loading: () => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 12),
                              Text(
                                'Loading comments...',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        // Loaded state
                        loaded: (comments) {
                          if (comments.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.comment_bank_outlined,
                                    size: 48,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'No comments yet',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Be the first to comment',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.outline,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: comments.length,
                            itemBuilder: (context, index) {
                              final comment = comments[index];
                              return _CommentCard(comment: comment);
                            },
                          );
                        },
                        // Error state
                        error: (msg) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 48,
                                color: colorScheme.error,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Error loading comments',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton.icon(
                                onPressed: () => context
                                    .read<CommentCubit>()
                                    .loadComments(widget.taskId),
                                icon: const Icon(Icons.refresh),
                                label: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ),

              // Input field at bottom
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: colorScheme.outlineVariant),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  12 + MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BlocBuilder<CommentCubit, CommentState>(
                  builder: (context, state) {
                    final isCreating = state.maybeWhen(
                      creatingComment: () => true,
                      orElse: () => false,
                    );

                    return Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _commentController,
                            enabled: !isCreating,
                            maxLines: null,
                            minLines: 1,
                            maxLength: 500,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: 'Add a comment...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide(
                                  color: colorScheme.outlineVariant,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide(
                                  color: colorScheme.primary,
                                  width: 2,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              counterText: '',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: isCreating
                                ? colorScheme.primaryContainer
                                : colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: isCreating
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    log('Send button pressed');
                                    if (_commentController.text
                                        .trim()
                                        .isEmpty) {
                                      log('Comment is empty');
                                      SnackBarHelper.showInfo(
                                        context,
                                        'Comment cannot be empty',
                                      );
                                      return;
                                    } else {
                                      _handleAddComment();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Individual comment card widget
class _CommentCard extends StatelessWidget {
  final CommentEntity comment;

  const _CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 18,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(Icons.person, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          // Comment content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anonymous',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(comment.content, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _formatTime(comment.postedAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(String isoDateTime) {
    try {
      final dateTime = DateTime.parse(isoDateTime);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inMinutes < 1) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
      }
    } catch (e) {
      return 'unknown time';
    }
  }
}
