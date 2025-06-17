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

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}
