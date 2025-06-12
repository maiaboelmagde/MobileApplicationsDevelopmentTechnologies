import 'package:flutter/material.dart';
import 'package:mvvm_api_practice/core/services/service_locator.dart';
import 'package:mvvm_api_practice/core/theme/theme_controller.dart';
import 'package:mvvm_api_practice/core/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Text('Home Screen',),
            Spacer(),
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => ThemeController.toggleTheme(),
            ),
          ],
        ),
      ),

      body: ChangeNotifierProvider<UserController>(
        create: (_) {
          final controller = locator<UserController>();
          controller.loadUsersData();
          return controller;
        },
        child: Consumer<UserController>(
          builder: (context, controllerValues, child) {
            if (controllerValues.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controllerValues.errorMsg != null) {
              return Center(child: Text(controllerValues.errorMsg!));
            }
            return ListView.builder(
              itemCount: controllerValues.users.length,
              itemBuilder: (context, index) {
                final curUser = controllerValues.users[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ValueListenableBuilder(
                    valueListenable: ThemeController.themeNotifier,
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Text('User $index',style: Theme.of(context).textTheme.labelLarge,),
                          ListTile( leading: Text('Name : '),title: Text(curUser.name,style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('Email : '),title: Text(curUser.email,style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('Phone : '),title: Text(curUser.phone,style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('Website : '),title: Text(curUser.companyName,style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('Company Name : '),title: Text(curUser.website,style: Theme.of(context).textTheme.bodyLarge,)),
                        ],
                      );
                    }
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
