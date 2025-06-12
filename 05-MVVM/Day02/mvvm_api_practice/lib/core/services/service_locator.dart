import 'package:get_it/get_it.dart';
import 'package:mvvm_api_practice/core/repositories/users_repository.dart';
import 'package:mvvm_api_practice/core/services/api_service.dart';
import 'package:mvvm_api_practice/core/view_model/user_view_model.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());

  locator.registerSingleton<UsersRepository>(
    UsersRepository(locator<ApiService>()),
  );

  locator.registerFactory<UserController>(
    () => UserController(locator<UsersRepository>()),
  );
}
