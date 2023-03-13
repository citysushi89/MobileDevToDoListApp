import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
// Gives the unmodifiable list view
import 'dart:collection';

// Used in conjuction with the Provider package
class TaskData extends ChangeNotifier {
  // Adding the underscore makes it a private property, which will make sure you
  // do not try to call tasks.add() later on... (this does not work, see void addTask)
  List<Task> _tasks = [
    Task(name: 'Your tasks here!'),
    Task(name: 'Sample task 2'),
  ];

  // From collection.dart
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  // Need to use a method to add tasks because the listender has to be nofitied to
  // be on the lookout for a new thing (this is why you cannot just use tasks.add())
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    // comes from task.dart
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
