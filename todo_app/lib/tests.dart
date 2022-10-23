import 'models/task.dart';
import 'dart:convert';

class TestData {
  List<Map<String, dynamic>> data = [
    {
      "task": "task 1",
      "isDone": false,
      "doneDate": null,
    },
    {
      "task": "task 2",
      "isDone": false,
      "doneDate": null,
    },
    {
      "task": "task 3",
      "isDone": true,
      "doneDate": "20/10/2022",
    },
    {
      "task": "task 4",
      "isDone": false,
      "doneDate": null,
    },
    {
      "task": "task 5",
      "isDone": true,
      "doneDate": "15/10/2022",
    },
  ];

  List<Task> getDummyTasks() {
    return List<Task>.from(
        json.decode(json.encode(data)).map((taskMap) => Task.fromMap(taskMap)));
  }
}
