import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(Null Function() param0);

  // const AddTaskScreen()({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                // This makes the cursor automatically go to the field
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.lightBlueAccent,
                child: TextButton(
                  onPressed: () {
                    // For info on below, see notes on models/task_data.dart
                    // Listen: false becasue error was thrown, info below
                    // This is likely caused by an event handler (like a button's onPressed) that called
                    // Provider.of without passing `listen: false`
                    // To fix, write: Provider.of<TaskData>(context, listen: false);
                    // It is unsupported because may pointlessly rebuild the widget associated to the
                    // event handler, when the widget tree doesn't care about the value.
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);

                    //  Removing the bottom sheet so you see the list view again
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
