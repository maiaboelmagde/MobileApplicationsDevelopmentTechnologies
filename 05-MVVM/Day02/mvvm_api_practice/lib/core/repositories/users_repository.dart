import 'package:mvvm_api_practice/core/services/api_service.dart';
import 'package:mvvm_api_practice/models/user_model.dart';

class UsersRepository {
  final ApiService apiService;
  UsersRepository(this.apiService);

  Future<List<UserModel>> loadUsers() async {
    String url = "https://jsonplaeholder.typicode.com/users";

    dynamic data = await apiService.getData(url);
    if (data is List) {
      List<UserModel> allUsers = data
          .map((user) => UserModel.fromJson(user))
          .toList();
      return allUsers.where((user) => user.phone.startsWith("1")).toList();
    } else {
      throw Exception("Unexpected API response");
    }
  }
}
