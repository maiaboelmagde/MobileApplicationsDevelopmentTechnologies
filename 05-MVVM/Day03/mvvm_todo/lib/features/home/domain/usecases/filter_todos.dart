import 'package:mvvm_todo/features/home/data/models/todo_model.dart';
import 'package:mvvm_todo/features/home/domain/repositories/todo_repository_base.dart';

class FilterTodos {
  FilterTodos(this.todoRepositoryBase);
  TodoRepositoryBase todoRepositoryBase;

  Future<List<TodoModel>> getParticularUserTodos(int userId) async{
    final allTodos = await todoRepositoryBase.getAllTodos();
    return allTodos.where((todo)=>todo.userId == userId).toList();
  }
}