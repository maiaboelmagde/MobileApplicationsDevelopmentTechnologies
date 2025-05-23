import 'dart:io';

void main(List<String> arguments) {
  double theBalance = 1000;
  bool exit = false;

  do{
    stdout.write('Welcome to the ATM.\nEnter your PIN: ');
    String? pin = stdin.readLineSync();
    if(pin == '1234'){
      break;
    }else{
      stdout.writeln('Invalid PIN !!');
    }
  }while(true);
  
  while(!exit){


    stdout.write('''\n\n--- ATM Menu ---
1. Check Balance
2. Deposit
3. Withdraw
4. Exit
Enter your choice:''');

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.writeln('Your current balance is: \$$theBalance');
        break;

      case '2':
        double? amount;
        do{
          stdout.writeln('Enter Deposit amount');
          String? input = stdin.readLineSync();
          if (input != null) {
            amount = double.tryParse(input);
          }
          if (amount == null || amount < 0) {
            stdout.writeln('Invalid amount !!');
          }else{
            theBalance += amount;
          }
        }while(amount == null || amount < 0);
        break;

      case '3':
        double? amount;
        do{
          stdout.writeln('Enter Withdraw amount');
          String? input = stdin.readLineSync();
          if (input != null) {
            amount = double.tryParse(input);
          }
          if (amount == null || amount < 0) {
            stdout.writeln('Invalid amount !!');
          }else{
            theBalance -= amount;
          }
        }while(amount == null || amount < 0);
        break;
      case '4':
        stdout.writeln('exit .. \nSee you soon ..');
        exit = true;
        break;
      default:
        stdout.writeln('Invalid Choice !!');
    }
  }
  

}
