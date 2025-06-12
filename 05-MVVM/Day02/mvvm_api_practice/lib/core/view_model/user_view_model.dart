import 'package:flutter/material.dart';
import 'package:mvvm_api_practice/core/repositories/users_repository.dart';
import 'package:mvvm_api_practice/models/user_model.dart';

class UserController extends ChangeNotifier {
  UsersRepository usersRepository;
  UserController(this.usersRepository);
  List<UserModel> users = [];
  bool isLoading = false;
  String? errorMsg;

  loadUsersData() async {
    isLoading = true;
    notifyListeners();
    try {
      users = await usersRepository.loadUsers();
      errorMsg = null;
    } catch (e) {
      errorMsg = 'some thing went wrong while geting users !';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
