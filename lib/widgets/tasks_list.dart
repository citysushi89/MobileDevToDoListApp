import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  // final List<Task> tasks;
  // const TasksList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    // Consumer comes from the provider package
    // This allows the use of "taskData" rather than Provider.of<TaskData>(context)
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                // from models/task_data.dart
                taskData.updateTask(task);
              },
              // Deletes the task if held
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
