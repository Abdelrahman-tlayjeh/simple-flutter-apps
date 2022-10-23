import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../tests.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _history = [];
  final Box _tasksBox = Hive.box("tasksBox");

  TasksProvider() {
    syncDataWithProvider();
  }

  List<Task> get tasks => _tasks;

  List<Task> get history => _history;

  int get tasksCount => _tasks.length;

  int get doneTasksCount {
    int count = 0;
    for (var task in _tasks) {
      if (task.isDone) count++;
    }
    return count;
  }

  String get todayDate => DateFormat('EEEE, d MMM').format(DateTime.now());

  void addNewTask({required task}) {
    _tasks.add(Task(task));
    notifyListeners();
    saveTasks();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    saveTasks();
  }

  void toggleDoneState(int index) {
    _tasks[index].toggleDoneState();
    notifyListeners();
    saveTasks();
  }

  void saveTasks() async {
    String encodedData =
        json.encode(_tasks.map((task) => task.toMap()).toList());
    _tasksBox.put("tasks", encodedData);
  }

  List<Task> loadDataFromBox() {
    String? encodedData = _tasksBox.get("tasks");
    List<Task> tasks;
    if (encodedData != null) {
      tasks = List<Task>.from(
          json.decode(encodedData).map((map) => Task.fromMap(map)));
    } else {
      tasks = [];
    }
    return tasks;
  }

  List<Task> loadDataFromTest() {
    TestData testData = TestData();
    return testData.getDummyTasks();
  }

  void syncDataWithProvider() {
    //load data
    List<Task> tasks = loadDataFromBox();
    //filter data
    List<Task> todayTasks = [];
    List<Task> oldTasks = [];
    DateTime now = DateTime.now();
    for (Task task in tasks) {
      //if task is done in the past
      if (task.isDone &&
          task.doneDate.compareTo(DateTime(now.year, now.month, now.day)) < 0) {
        oldTasks.add(task);
      }
      //if task is not done or done today
      else {
        todayTasks.add(task);
      }
    }
    _tasks = todayTasks;
    _history = oldTasks;
    notifyListeners();
  }
}
