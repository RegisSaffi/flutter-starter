import 'package:checkme/models/task.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TasksNotifier extends Notifier<AsyncValue<List<Task>>> {
  @override
  build() {
    return AsyncValue.data([]);
  }

  Future<void> loadTasks() async {
    Dio dio = Dio();
    state = AsyncValue.loading();
    try {
      var response = await dio.get("https://dummyjson.com/todos");
      List data = response.data["todos"];
      List<Task> tasks = data.map((obj) => Task.fromJson(obj)).toList();
      state = AsyncValue.data(tasks);
    } catch (exception, stackTrace) {
      state = AsyncValue.error("Failed to load data", stackTrace);
    }
  }

  void addTask(Task task) {
    state = AsyncValue.data([task, ...state.value ?? []]);
  }

  void completeTask(Task task) {
    List<Task> allTasks = [...state.value ?? []];
    var index = allTasks.indexOf(task);
    task.completed = !task.completed;
    allTasks[index] = task;
    state = AsyncValue.data(allTasks);
  }

  void deleteTask(Task task) {
    List<Task> allTasks = [...state.value ?? []];
    var index = allTasks.indexOf(task);
    allTasks.removeAt(index);
    state = AsyncValue.data(allTasks);
  }
}
