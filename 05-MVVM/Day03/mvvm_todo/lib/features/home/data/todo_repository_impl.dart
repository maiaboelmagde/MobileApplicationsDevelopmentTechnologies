import 'dart:developer';
import 'package:mvvm_todo/core/services/api_service_base.dart';
import 'package:mvvm_todo/core/services/preference_manager.dart';
import 'package:mvvm_todo/features/home/data/data_source/local_todo_data_source.dart';
import 'package:mvvm_todo/features/home/data/models/todo_model.dart';
import 'package:mvvm_todo/features/home/domain/repositories/todo_repository_base.dart';

class TodoRepositoryImpl extends TodoRepositoryBase {
  PreferencesManager prefs = PreferencesManager();

  TodoRepositoryImpl(this.apiService, this.localTodoDataSource);
  ApiServiceBase apiService;
  LocalTodoDataSource localTodoDataSource;
  @override
  Future<List<TodoModel>> getAllTodos() async {
    List<TodoModel> toDos;
    try {
      List<dynamic> data = await apiService.getData(
        'https://jsonplaceholder.typicode.com/todos',
        headers: {'Accept': 'application/json'},
      );
      localTodoDataSource.cacheToDos(data);
      toDos = data.map((element) => TodoModel.fromJson(element)).toList();
      return toDos;
    } catch (e) {
      List<TodoModel>? cacheToDos = localTodoDataSource.getCachedToDos();
      if (cacheToDos != null) {
        return cacheToDos;
      }

      log('error at TodoRepositoryImpl: $e');

      throw Exception('Some thing went wrong while getting todos');
    }
  }

  
}
