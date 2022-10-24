import 'package:flutter/material.dart';
import '../models/task.dart';

class DateHistory extends StatelessWidget {
  final String date;
  final List<Task> tasks;
  const DateHistory({required this.date, required this.tasks, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: const Color.fromARGB(255, 29, 52, 119),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text(
            date,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          Column(
            children: tasks
                .map((e) => ListTile(
                      leading: const Icon(
                        Icons.done,
                        size: 25,
                        color: Colors.orange,
                      ),
                      title: Text(
                        e.task,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const Divider(
            thickness: 10,
          ),
        ],
      ),
    );
  }
}
