import 'dart:io';

import 'User.dart';
import 'data.dart';

void main()async{
  List<User> usersList = [];

  while(true){
    stdout.write('Enter user ID: ');
    String? input = stdin.readLineSync();
    User? myUser;
    if(input == 'done'){
      break;
    }
    if(input != null){
     myUser = await getUserById(input);
    }
    
    if(input == null || myUser == null){
      print('Invalid User Id ..');
    }else{
      print('User fetched: $myUser');
      usersList.add(myUser);
    }
  }

  List<User> adultUsers = usersList.where((user)=>user.age >= 18).toList();
  
  stdout.write('Adult users: $adultUsers \n');
}