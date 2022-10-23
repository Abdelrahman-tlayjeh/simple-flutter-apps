import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tasks_provider.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int doneTasks = context.watch<TasksProvider>().doneTasksCount;
    int allTasks = context.watch<TasksProvider>().tasksCount;
    String today = context.read<TasksProvider>().todayDate;
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 20,
        left: 20,
      ),
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 52, 79, 161),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //date
          Text(
            today,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),

          //tasks count
          Row(
            children: [
              Text(
                "$doneTasks/$allTasks",
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.task_alt_outlined,
                size: 25,
                color: Color.fromARGB(255, 221, 136, 39),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
