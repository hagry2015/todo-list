import 'dart:convert';

class Task {
  String title;
  String description;

  bool isCompleted;

  Task({required this.title,required this.description, this.isCompleted = false});

  // Convert Task to a map for saving in SharedPreferences
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  // Convert a map to a Task
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],

      isCompleted: map['isCompleted'],
    );
  }

  // Encode task to JSON
  static String encode(List<Task> tasks) => json.encode(
    tasks.map<Map<String, dynamic>>((task) => task.toMap()).toList(),
  );

  // Decode tasks from JSON
  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromMap(item))
          .toList();
}