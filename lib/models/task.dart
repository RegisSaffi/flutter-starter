class Task {
  int id;
  String todo;
  bool completed;
  int userId;

  Task({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Task.fromTodo(String todo) {
    return Task(id: 1, todo: todo, completed: false, userId: 0);
  }
}
