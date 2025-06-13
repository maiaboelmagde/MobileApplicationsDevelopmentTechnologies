import 'dart:convert';
import 'dart:developer';

import 'package:mvvm_todo/core/constants/preferences_keys.dart';
import 'package:mvvm_todo/core/services/preference_manager.dart';
import 'package:mvvm_todo/features/home/data/models/todo_model.dart';

class LocalTodoDataSource {
  PreferencesManager prefs = PreferencesManager();
  void cacheToDos(List<dynamic> toDos) {
    prefs.setString(PreferencesKeys.toDo, jsonEncode(toDos));
  }
  List<TodoModel>? getCachedToDos() {
    log('Get cashed todos ..');
    String? cachedToDos = prefs.getString(PreferencesKeys.toDo);

    if (cachedToDos != null) {
      List<dynamic> decodedToDos = jsonDecode(cachedToDos);
      return decodedToDos.map((ele) => TodoModel.fromJson(ele)).toList();
    }
    return null;
  }
}