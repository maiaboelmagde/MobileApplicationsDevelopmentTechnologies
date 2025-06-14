import 'package:flutter/material.dart';
import 'package:mvvm_todo/features/home/data/models/todo_model.dart';
import 'package:mvvm_todo/features/home/domain/repositories/todo_repository_base.dart';
import 'package:mvvm_todo/features/home/domain/usecases/filter_todos.dart';

class TodosController extends ChangeNotifier {
  List<TodoModel> _allToDos = [];
  bool _isLoading = false;
  String? _errorMsg;
  FilterTodos filteredTodos;

  TodosController(this.filteredTodos);

  get allToDos=>_allToDos;
  bool get isLoading=>_isLoading;
  String? get errorMsg=>_errorMsg;


  fechAllToDos() async {
    _isLoading = true;
    notifyListeners();
    try {
      _allToDos = await filteredTodos.getParticularUserTodos(1);
    } on Exception catch (e) {
      _errorMsg = '$e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
