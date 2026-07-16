import 'package:uuid/uuid.dart';

enum TaskPriority { Low, Medium, High }

class Task {
  final String id;
  String title;
  String description;
  TaskPriority priority;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.priority = TaskPriority.Medium,
    this.isCompleted = false,
  });

  Task copyWith({String? title, String? description, TaskPriority? priority, bool? isCompleted}) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}