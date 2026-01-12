// import 'package:kanban_app/domain/entities/tasks/task_entity.dart';

// class TaskDueModel extends TaskDue {
//   const TaskDueModel({
//     required super.date,
//     required super.isRecurring,
//     super.datetime,
//     super.string,
//     super.timezone,
//   });

//   factory TaskDueModel.fromJson(Map<String, dynamic> json) {
//     return TaskDueModel(
//       date: json['date'] as String,
//       isRecurring: json['is_recurring'] as bool,
//       datetime: json['datetime'] as String?,
//       string: json['string'] as String?,
//       timezone: json['timezone'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'date': date,
//       'is_recurring': isRecurring,
//       if (datetime != null) 'datetime': datetime,
//       if (string != null) 'string': string,
//       if (timezone != null) 'timezone': timezone,
//     };
//   }
// }

// class TaskDeadlineModel extends TaskDeadline {
//   const TaskDeadlineModel({required super.date});

//   factory TaskDeadlineModel.fromJson(Map<String, dynamic> json) {
//     return TaskDeadlineModel(date: json['date'] as String);
//   }

//   Map<String, dynamic> toJson() {
//     return {'date': date};
//   }
// }

// class Task extends TaskEntity {
//   const Task({
//     required super.id,
//     required super.content,
//     required super.description,
//     required super.commentCount,
//     required super.isCompleted,
//     required super.order,
//     required super.priority,
//     required super.projectId,
//     required super.labels,
//     super.due,
//     super.deadline,
//     super.sectionId,
//     super.parentId,
//     required super.creatorId,
//     required super.createdAt,
//     super.assigneeId,
//     super.assignerId,
//   });
// }
