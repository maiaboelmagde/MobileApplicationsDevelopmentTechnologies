import 'package:flutter/material.dart';
import 'package:mvvm_auth/core/view_model/user_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: ValueListenableBuilder(
        valueListenable: UserViewModel.userNotifier,
        builder: (_, value, _) {
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: Card(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome ${value.name} \n email: ${value.email}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
