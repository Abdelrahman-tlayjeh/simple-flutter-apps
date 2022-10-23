import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_row.dart';
import 'package:provider/provider.dart';
import '../providers/tasks_provider.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = context.watch<TasksProvider>().tasks;
    return Consumer(
      builder: (BuildContext context, value, Widget? child) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 52, 79, 161),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TaskRow(
                      taskId: index,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
