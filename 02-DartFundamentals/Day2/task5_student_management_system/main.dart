import 'dart:io';

import 'student.dart';

void main() {
  final students = <String, Student>{};

  while (true) {
    stdout.write('Enter student data (name,age,major): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().toLowerCase() == 'done') break;

    final parts = input.split(',');
    if (parts.length != 3) {
      print('Invalid format. Please use name,age,major.');
      continue;
    }

    try {
      String name = parts[0].trim();
      int age = int.parse(parts[1].trim());
      String major = parts[2].trim();

      final student = Student(name:name, age:age, major:major);
      students[ name] = student;
    } catch (e) {
      print('Error: $e');
    }
  }

  print('\nAdult students:');
  students.forEach((key, student) {
    if (student.age >= 18) {
      print('$key: ${student.toString()}');
    }
  });
}
