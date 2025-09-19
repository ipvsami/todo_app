import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/tasks.dart';

class TaskProvider with ChangeNotifier {
  List<Tasks> _tasks = [];

  List<Tasks> get tasks => _tasks;

  void addTask(Tasks task) {
    _tasks.add(task);
    saveTasks();
    notifyListeners();
  }

  void checkTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    saveTasks();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    saveTasks();
    notifyListeners();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = _tasks.map((t) => t.toJson()).toList();
    prefs.setString('tasks', jsonEncode(tasksJson));
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List decoded = jsonDecode(tasksString);
      _tasks = decoded.map((json) => Tasks.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
