import 'package:checkme/models/task.dart';
import 'package:checkme/providers/tasks/tasks_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var tasksListProvider = NotifierProvider<TasksNotifier, AsyncValue<List<Task>>>(
  () => TasksNotifier(),
);
