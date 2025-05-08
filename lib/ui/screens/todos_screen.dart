import 'package:checkme/models/task.dart';
import 'package:checkme/providers/tasks/providers.dart';
import 'package:checkme/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosScreen extends ConsumerStatefulWidget {
  const TodosScreen({super.key});

  @override
  ConsumerState<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends ConsumerState<TodosScreen> {
  int viewType = 0;
  TextEditingController taskController = TextEditingController();

  test() {
    // Task task = Task(id: 1, todo: "", completed: true, userId: 1000);
  }

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(themeProvider);
    var tasks = ref.watch(tasksListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("CheckMe"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
            icon: Icon(
              theme == ThemeMode.dark ? Icons.brightness_7 : Icons.brightness_4,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(50, 120),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          Task task = Task.fromTodo(taskController.text);
                          ref.read(tasksListProvider.notifier).addTask(task);
                          taskController.clear();
                        },
                        child: Icon(Icons.send_rounded),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Activities",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Row(
                      children: [
                        FilterChip(
                          label: Text("List"),
                          selected: viewType == 0,
                          onSelected: (value) {
                            setState(() {
                              viewType = 0;
                            });
                          },
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: FilterChip(
                            label: Text("Grid"),
                            selected: viewType == 1,
                            onSelected: (value) {
                              setState(() {
                                viewType = 1;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body:
          viewType == 0
              ? ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Task task = tasks[index];
                  return CheckboxListTile(
                    secondary: Icon(Icons.task),
                    title: Text(task.todo),
                    value: task.completed,
                    onChanged: (bool? value) {
                      ref.read(tasksListProvider.notifier).completeTask(task);
                    },
                  );
                },
                itemCount: tasks.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              )
              : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  Task task = tasks[index];
                  return Card.outlined(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.task, size: 50),
                              ),
                              Text(task.todo),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Checkbox(
                            value: task.completed,
                            onChanged: (value) {
                              ref
                                  .read(tasksListProvider.notifier)
                                  .completeTask(task);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: tasks.length,
              ),
    );
  }
}
