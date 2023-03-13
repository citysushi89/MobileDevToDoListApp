class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    // flips the value of done whichever value it holds
    isDone = !isDone;
  }
}
