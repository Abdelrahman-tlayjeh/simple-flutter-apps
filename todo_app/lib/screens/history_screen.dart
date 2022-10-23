import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/date_history.dart';
import '../models/task.dart';
import '../providers/tasks_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  String encodeDate(DateTime date) => "${date.day}-${date.month}-${date.year}";

  Map<String, List<Task>> classifyHistory(List<Task> history) {
    Map<String, List<Task>> results = {};
    for (Task task in history) {
      String doneDate = encodeDate(task.doneDate);
      if (results.containsKey(doneDate)) {
        results[doneDate]?.add(task);
      } else {
        results[doneDate] = <Task>[task];
      }
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Task>> history =
        classifyHistory(context.watch<TasksProvider>().history);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 53, 135),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TasksProvider>().clearHistory();
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 211, 80, 4),

        //title
        title: const Text(
          "History",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 29, 52, 119),
          ),
        ),
      ),
      body: Visibility(
        visible: history.keys.isNotEmpty,
        replacement: const Center(
          child: Text(
            "No History To Show",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white54,
            ),
          ),
        ),
        child: ListView(
            children: history.entries.map((e) {
          return DateHistory(date: e.key, tasks: e.value);
        }).toList()),
      ),
    );
  }
}
