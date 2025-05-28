import 'User.dart';

List<User> usersData =[
  User("1", "User 1",26),
  User("2", "User 2",17),
  User("3", "User 3",15),
  User("4", "User 4",20),
];

Future<User?> getUserById(String id)async{
  await Future.delayed(Duration(seconds: 1));
  return usersData.singleWhere((user)=>user.id == id);
}