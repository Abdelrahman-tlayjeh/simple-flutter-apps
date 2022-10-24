import 'models/task.dart';

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
    {
      "task": "task 6",
      "isDone": true,
      "doneDate": "15/10/2022",
    },
    {
      "task": "task 7",
      "isDone": true,
      "doneDate": "15/10/2022",
    },
    {
      "task": "task 8",
      "isDone": false,
      "doneDate": null,
    },
    {
      "task": "task 9",
      "isDone": true,
      "doneDate": "1/10/2022",
    },
    {
      "task": "task 10",
      "isDone": true,
      "doneDate": "28/9/2022",
    },
  ];

  List<Task> getDummyTasks() {
    return List<Task>.from(data.map((taskMap) => Task.fromMap(taskMap)));
  }
}
