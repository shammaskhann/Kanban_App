import 'package:flutter/material.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/core/utils/utils_helper.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';

// ignore: non_constant_identifier_names
Widget TaskCard(
  BuildContext context,
  TaskEntity task, {
  bool showActions = true,
  VoidCallback? onEdit,
  VoidCallback? onDelete,
  VoidCallback? onComments,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final statusColor = task.status == TaskStatus.done
      ? Colors.green
      : task.status == TaskStatus.inProgress
      ? Colors.purple
      : Colors.orange;
  final status = task.status == TaskStatus.done
      ? 'Done'
      : TaskStatus.inProgress == task.status
      ? 'In Progress'
      : 'To Do';
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
    decoration: BoxDecoration(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: colorScheme.primary.withOpacity(0.2),
          blurRadius: 12,
          spreadRadius: 0,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: colorScheme.onSurface.withOpacity(0.08),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
      border: Border.all(color: colorScheme.primary.withOpacity(0.4), width: 1),
    ),
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.content,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w300,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Status Glowing with the respective color 'To Do',  Colors.orange, Icons.pending, 'In Progress',    Colors.purple, Icons.autorenew,'Done' Colors.green,Icons.check_circle,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: statusColor, width: 1.0),
                      ),
                      child: Text(
                        status,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    //Timer Icon with duration
                    Column(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(height: 4),
                        Text(
                          DateHelper.secondsToShortTimeString(task.duration),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    //Comment Icon with comment count
                    if (showActions)
                      InkWell(
                        onTap: onComments,
                        child: Column(
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            SizedBox(height: 4),
                            Text(
                              task.commentCount.toString(),
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                // Edit button
                showActions
                    ? Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            onPressed: onEdit,
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              visualDensity: VisualDensity.compact,
                            ),
                            tooltip: 'Edit',
                          ),

                          // Delete button
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: colorScheme.error,
                            ),
                            onPressed: onDelete,
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              visualDensity: VisualDensity.compact,
                            ),
                            tooltip: 'Delete',
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
