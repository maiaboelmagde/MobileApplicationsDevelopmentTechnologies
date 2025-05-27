import 'person.dart';

class Student extends Person{
  String major;
  Student({required this.major, required String name, required int age}):super(name,age);

  String toString() => '${super.toString()}, Major: $major';

}
