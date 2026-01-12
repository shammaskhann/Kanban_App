import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/core/utils/utils_helper.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/presentation/common/components/button2.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';

class UpdateTaskSheet extends StatefulWidget {
  final TaskEntity task;

  const UpdateTaskSheet({super.key, required this.task});

  @override
  State<UpdateTaskSheet> createState() => _UpdateTaskSheetState();
}

class _UpdateTaskSheetState extends State<UpdateTaskSheet> {
  late TextEditingController contentController;
  DateTime? dueDate;
  late TaskStatus status;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController(text: widget.task.content);
    status = widget.task.status;
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Update Task', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<TaskStatus>(
            value: status,
            items: TaskStatus.values.map((s) {
              return DropdownMenuItem(value: s, child: Text(s.name));
            }).toList(),
            onChanged: (val) {
              if (val != null) setState(() => status = val);
            },
            decoration: const InputDecoration(labelText: 'Status'),
          ),
          const SizedBox(height: 15),
          // TextField(
          //   controller: dueDateController,
          //   readOnly: true,
          //   decoration: const InputDecoration(
          //     labelText: 'Pick Due Date (optional)',
          //   ),
          //   onTap: () async {
          //     final picked = await showDatePicker(
          //       context: context,
          //       initialDate:
          //           DateHelper.parseDate(widget.task.deadline) ?? DateTime.now(),
          //       firstDate: DateTime(2000),
          //       lastDate: DateTime(2100),
          //     );
          //     if (picked != null) {
          //       setState(() {
          //         dueDate = picked;
          //         dueDateController.text =
          //             picked.toIso8601String().substring(0, 10);
          //       });
          //     }
          //   },
          // ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: MinimalButton(
              icon: Icons.arrow_forward_ios,
              label: "Update",
              onTap: () async {
                final content = contentController.text.trim();
                final dueString = dueDate?.toIso8601String();
                await context.read<TaskBoardCubit>().updateTask(
                  taskId: widget.task.id,
                  content: content.isEmpty ? null : content,
                  duration: null,
                  status: status,
                );
                if (mounted) Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
