import 'package:checkme/models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TasksNotifier extends Notifier<List<Task>> {
  @override
  build() {
    return [];
  }

  void addTask(Task task) {
    state = [task, ...state];
  }

  void completeTask(Task task) {
    var allTasks = [...state];
    var index = allTasks.indexOf(task);
    task.completed = !task.completed;
    allTasks[index] = task;
    state = allTasks;
  }
}
