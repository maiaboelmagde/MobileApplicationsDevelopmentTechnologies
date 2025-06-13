import 'package:mvvm_todo/features/home/data/models/todo_model.dart';

abstract class TodoRepositoryBase {
  Future<List<TodoModel>> getAllTodos();
}
