import 'package:flutter/material.dart';
import 'package:mvvm_auth/core/extensions/extensions.dart';
import 'package:mvvm_auth/core/theme/theme_controller.dart';
import 'package:mvvm_auth/core/view_model/user_view_model.dart';
import 'package:mvvm_auth/features/home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userPaswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => ThemeController.toggleTheme(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'user Name is required ..';
                    } else if (!value.isValidUsername) {
                      return 'Invalid user name, should contain only letters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    label: Text('Enter your Name'),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _userEmailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'user email is required ..';
                    } else if (!value.isValidEmail) {
                      return 'Invalid email !!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    label: Text('Enter your email'),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  obscureText: true,

                  controller: _userPaswordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'password is required ..';
                    } else if (!value.isValidPassword) {
                      return 'Invalid pasword, should be more than 8 letters, contains upper/lower/special letters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    label: Text('enter password ..'),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password confirmation is required ..';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    label: Text('Password confirmation ..'),
                  ),
                ),
                SizedBox(height: 80),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        UserViewModel.setUserModel(
                          _userNameController.value.text,
                          _userEmailController.text,
                          _userPaswordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: Text('sign up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
