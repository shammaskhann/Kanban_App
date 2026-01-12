import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/presentation/common/components/button2.dart';
import 'package:kanban_app/presentation/screen/Task-board/cubit/task_board_cubit.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  late TextEditingController contentController;
  late TextEditingController dateController;
  DateTime? dueDate;
  TaskStatus status = TaskStatus.todo;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    contentController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Task', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 12),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: MinimalButton(
              icon: Icons.arrow_forward_ios,
              label: "Add Task",
              onTap: () async {
                final content = contentController.text.trim();
                if (content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter task name'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                await context.read<TaskBoardCubit>().addTask(
                  content: content,
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
