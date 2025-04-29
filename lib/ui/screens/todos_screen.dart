import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  int viewType = 0;

  @override
  Widget build(BuildContext context) {
    print(viewType);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOS"),
        bottom: PreferredSize(
          preferredSize: Size(50, 50),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    trailing: Text("12:30"),
                  );
                },
                itemCount: 100,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(indent: 60);
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
