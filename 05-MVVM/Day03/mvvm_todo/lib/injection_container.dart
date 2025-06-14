import 'package:get_it/get_it.dart';
import 'package:mvvm_todo/core/services/api_service.dart';
import 'package:mvvm_todo/core/services/api_service_base.dart';
import 'package:mvvm_todo/features/home/data/data_source/local_todo_data_source.dart';
import 'package:mvvm_todo/features/home/data/todo_repository_impl.dart';
import 'package:mvvm_todo/features/home/domain/repositories/todo_repository_base.dart';
import 'package:mvvm_todo/features/home/domain/usecases/filter_todos.dart';
import 'package:mvvm_todo/features/home/presentation/controllers/todos_controller.dart';

GetIt locator = GetIt.instance;

setupLocatot() {
  locator.registerSingleton<ApiServiceBase>(ApiService());

  locator.registerSingleton<LocalTodoDataSource>(LocalTodoDataSource());

  locator.registerSingleton<TodoRepositoryBase>(
    TodoRepositoryImpl(locator<ApiServiceBase>(),locator<LocalTodoDataSource>()),
  );

  locator.registerSingleton<FilterTodos>(
    FilterTodos(locator<TodoRepositoryBase>())
  );
  locator.registerSingleton<TodosController>(
    TodosController(locator<FilterTodos>()),
  );
}
