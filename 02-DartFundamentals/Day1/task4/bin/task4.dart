import 'package:task4/task4.dart' as task4;
import 'dart:io';

void main(List<String> arguments) {
  while(true){
    
    stdout.writeln("Enter first name (or 'exit' to quit): ");
    String? firstInput = stdin.readLineSync();

    if(firstInput == 'exit') break;

    if(firstInput != null && firstInput.isNotEmpty){
      String firstName = firstInput;
      stdout.writeln("Enter last name (optional, press Enter to skip): ");
      String? lastName = stdin.readLineSync();
      stdout.writeln("Enter title (optional, press Enter for 'Mr.'): ");
      String? title = stdin.readLineSync();

      print("Formatted name: ${task4.formatName(first: firstName ,last: lastName, title: title??'Mr')}");
    }else{
      print("First Name can't be null");
    }
  }
}
