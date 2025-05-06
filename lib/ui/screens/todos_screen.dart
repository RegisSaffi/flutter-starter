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

  test() {
    // Task task = Task(id: 1, todo: "", completed: true, userId: 1000);
    // var id = task._ id;
    // var id2 = task.getId();
    // task.id = 2;
  }

  @override
  Widget build(BuildContext context) {
    var theme = ref.watch(themeProvider);
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
          preferredSize: Size(50, 50),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
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
          ),
        ),
      ),
      body:
          viewType == 0
              ? ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("My activity"),
                    subtitle: Text("This is the last message"),
                    trailing: Text("12:30"),
                  );
                },
                itemCount: 100,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              )
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return Card.outlined();
                },
              ),
    );
  }
}
