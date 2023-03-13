import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider gives the data from TaskData to everything in the app,
    // Otherwise would have to pass the data up and down the tree
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
