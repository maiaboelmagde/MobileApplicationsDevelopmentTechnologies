import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:mvvm_auth/core/models/user_model.dart';

class UserViewModel {
  static ValueNotifier<UserModel> userNotifier = ValueNotifier(UserModel(name: '', email: '', password: ''));
  static void setUserModel (String name, String email, String password){
    log('user changed');
    log('${name}, ${email}, $password');

    userNotifier.value = UserModel(name: name, email: email, password: password);
    log('${userNotifier.value.name}, ${userNotifier.value.email}, ${userNotifier.value.password}');
  }
}