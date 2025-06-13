class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> jsonData) => TodoModel(
    userId: jsonData['userId'],
    id: jsonData['id'],
    title: jsonData['title'],
    completed: jsonData['completed'],
  );


}
