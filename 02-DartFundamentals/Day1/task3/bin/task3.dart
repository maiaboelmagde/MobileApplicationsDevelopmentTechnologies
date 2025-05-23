import 'dart:io';
import 'package:task3/task3.dart' as task3;

void main(List<String> arguments) {
  double? first, second;
  String? operator;
  

  while(true){
    bool validInput = false;
    do{
      print('Enter first number: ');
      String? input = stdin.readLineSync();
      if(input != null){
        double? valid = double.tryParse(input);
        if(valid != null){
          validInput = true;
          first = valid;
        }else{
          print('Error: Please enter a valid number.');
        }
      }
      
    }while(validInput == false);

    validInput = false;

    do{
      print('Enter Second number: ');
      String? input = stdin.readLineSync();
      if(input != null){
        double? valid = double.tryParse(input);
        if(valid != null){
          validInput = true;
          second = valid;
        }else{
          print('Error: Please enter a valid number.');
        }
      }
      
    }while(validInput == false);

    validInput = false;

    do{
      print("Enter operator (+, -, *, /, or 'q' to quit): ");
      String? input = stdin.readLineSync();
      if(input != null && (input == '+' || input == '-' || input == '*' || input == '/' || input == 'q')){
        operator = input;
        validInput = true;
      }else{
        print('Error: Please enter a valid operator.');
      }
      
    }while(validInput == false);  


    if(operator == '/' && second == 0){
      print('Error: Division by zero is not allowed.');
      continue;
    }

    if (operator == 'q'){
      break;
    }else{
      print('Result: $first + $second = ${task3.calculate(first!, second!, operator!)}');
    }
  }
}
