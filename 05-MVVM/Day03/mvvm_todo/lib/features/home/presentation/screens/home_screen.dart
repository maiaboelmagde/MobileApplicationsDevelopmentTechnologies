import 'package:flutter/material.dart';
import 'package:mvvm_todo/core/theme/theme_controller.dart';
import 'package:mvvm_todo/features/home/data/models/todo_model.dart';
import 'package:mvvm_todo/features/home/presentation/controllers/todos_controller.dart';
import 'package:mvvm_todo/injection_container.dart';
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
            Text('Home Screen'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () => ThemeController.toggleTheme(),
            ),
          ],
        ),
      ),

      body: ChangeNotifierProvider<TodosController>(
        create: (_) =>
            locator<TodosController>()..fechAllToDos(),

        child: Consumer<TodosController>(builder: (_, controllerValues, _){
          if (controllerValues.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controllerValues.errorMsg != null) {
              return Center(child: Text(controllerValues.errorMsg!));
            }

            return ListView.builder(
              itemCount: controllerValues.allToDos.length,
              itemBuilder: (context, index) {
                final TodoModel curTodo = controllerValues.allToDos[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                        children: [
                          Checkbox(value: curTodo.completed, onChanged: (bool? value) { },),
                          Text('ToDo $index',style: Theme.of(context).textTheme.labelLarge,),
                          ListTile( leading: Text('id : '),title: Text('${curTodo.id}',style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('title : '),title: Text(curTodo.title,style: Theme.of(context).textTheme.bodyLarge,)),
                          ListTile( leading: Text('userId : '),title: Text('${curTodo.userId}',style: Theme.of(context).textTheme.bodyLarge,)),
                        ],
                      )
                    
                );
              },
            );
        }),
      ),

      // body: ChangeNotifierProvider<UserController>(
      //   create: (_) {
      //     final controller = locator<UserController>();
      //     controller.loadUsersData();
      //     return controller;
      //   },
      //   child: Consumer<UserController>(
      //     builder: (context, controllerValues, child) {
      //       if (controllerValues.isLoading) {
      //         return const Center(child: CircularProgressIndicator());
      //       }

      //       if (controllerValues.errorMsg != null) {
      //         return Center(child: Text(controllerValues.errorMsg!));
      //       }
      //       return ListView.builder(
      //         itemCount: controllerValues.users.length,
      //         itemBuilder: (context, index) {
      //           final curUser = controllerValues.users[index];
      //           return Card(
      //             margin: const EdgeInsets.all(8),
      //             child: ValueListenableBuilder(
      //               valueListenable: ThemeController.themeNotifier,
      //               builder: (context, value, child) {
      //                 return Column(
      //                   children: [
      //                     Text('User $index',style: Theme.of(context).textTheme.labelLarge,),
      //                     ListTile( leading: Text('Name : '),title: Text(curUser.name,style: Theme.of(context).textTheme.bodyLarge,)),
      //                     ListTile( leading: Text('Email : '),title: Text(curUser.email,style: Theme.of(context).textTheme.bodyLarge,)),
      //                     ListTile( leading: Text('Phone : '),title: Text(curUser.phone,style: Theme.of(context).textTheme.bodyLarge,)),
      //                     ListTile( leading: Text('Website : '),title: Text(curUser.companyName,style: Theme.of(context).textTheme.bodyLarge,)),
      //                     ListTile( leading: Text('Company Name : '),title: Text(curUser.website,style: Theme.of(context).textTheme.bodyLarge,)),
      //                   ],
      //                 );
      //               }
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
