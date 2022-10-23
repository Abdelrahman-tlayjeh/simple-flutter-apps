import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tasks_provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color.fromARGB(255, 52, 79, 161),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "New Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          TextField(
            autofocus: true,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
            controller: taskController,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              String task = taskController.text;
              //if input is empty
              if (task == "") return;

              //add the entered task
              context.read<TasksProvider>().addNewTask(task: task);
              //close the screen
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text(
              "Add",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 29, 52, 119),
              ),
            ),
          )
        ],
      ),
    );
  }
}
