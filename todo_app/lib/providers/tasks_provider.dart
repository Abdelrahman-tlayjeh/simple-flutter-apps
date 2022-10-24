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

  //return active tasks
  List<Task> get tasks => _tasks;

  //return old done tasks
  List<Task> get history => _history;

  //return active tasks count
  int get tasksCount => _tasks.length;

  //return done active tasks count
  int get doneTasksCount {
    int count = 0;
    for (var task in _tasks) {
      if (task.isDone) count++;
    }
    return count;
  }

  //return today date in custom format
  String get todayDate => DateFormat('EEEE, d MMM').format(DateTime.now());

  //add new task to active tasks and update box
  void addNewTask({required task}) {
    _tasks.add(Task(task));
    notifyListeners();
    saveTasks();
  }

  //delete the task with given index from active tasks and update box
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    saveTasks();
  }

  //check/unckeck the task with given index and update box
  void toggleDoneState(int index) {
    _tasks[index].toggleDoneState();
    notifyListeners();
    saveTasks();
  }

  //update data in box
  void saveTasks() {
    String encodedData =
        json.encode((_tasks + _history).map((task) => task.toMap()).toList());
    _tasksBox.put("tasks", encodedData);
  }

  //clear all old tasks from box
  void clearHistory() {
    _history = [];
    notifyListeners();
    saveTasks();
  }

  //load encodedData from box
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

  //load fake data for testing
  List<Task> loadDataFromTest() {
    TestData testData = TestData();
    return testData.getDummyTasks();
  }

  //load data on initializing a TasksProvider object
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
