import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/tasks_provider.dart';

class TaskRow extends StatelessWidget {
  final int taskId;
  const TaskRow({
    required this.taskId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task task = context.watch<TasksProvider>().tasks[taskId];
    return ListTile(
      title: Text(
        task.task,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Color.fromARGB(255, 221, 106, 39),
          size: 25,
        ),
        onPressed: () {
          context.read<TasksProvider>().deleteTask(taskId);
        },
        splashRadius: 0.1,
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (newValue) {
          context.read<TasksProvider>().toggleDoneState(taskId);
        },
      ),
    );
  }
}
