import 'package:task1/task1.dart' as function;
import 'dart:io';

void main(List<String> arguments) {

  int num = -1;
  bool exit = false;

  while(!exit){
    stdout.write('Enter a number (or "q" to exit):  ');
    String? input = stdin.readLineSync();

    if(input == 'q'){
      exit = true;
      continue;
    }

    
    if(input != null){
      int? num = int.tryParse(input);
      if(num == null){
        stdout.writeln('Error: Please enter a valid integer');
      }else if(num < 0){
        stdout.writeln('Error: Please enter a non-negative number.');
      }else{
        stdout.writeln('Factorial of $num is ${function.calcFactorial(num)}');
      }

    }
  }
}
