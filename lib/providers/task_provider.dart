import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  String _filter = 'All';

  List<Task> get tasks {
    if (_filter == 'Pending') return _tasks.where((t) => !t.isCompleted).toList();
    if (_filter == 'Completed') return _tasks.where((t) => t.isCompleted).toList();
    return _tasks;
  }

  String get currentFilter => _filter;

  void addTask(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    int index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void toggleStatus(String id) {
    int index = _tasks.indexWhere((t) => t.id == id);
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}