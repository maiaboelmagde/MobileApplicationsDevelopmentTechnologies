import 'dart:io';
import 'bank_acount_class.dart';

void main(){
  String? input;
  double initialBalance = 0;
  double depositAmount = 0;
  double withdrawalAmount = 0;

  BankAccount bankAccount = BankAccount(initialBalance);


  do{
    stdout.write('Enter deposit amount: ');
    input = stdin.readLineSync();
    if(input != null){
      double? inputNum = double.tryParse(input);
      if(inputNum == null){
        input = null;
      }else{
        depositAmount = inputNum;
      }
    }
    if(input == null) print('Invalid Input');
  }while(input == null);

  bankAccount.deposit(depositAmount);
  print(bankAccount.getBalance);


  do{
    stdout.write('Enter withdrawal amount: ');
    input = stdin.readLineSync();
    if(input != null){
      double? inputNum = double.tryParse(input);
      if(inputNum == null){
        input = null;
      }else{
        withdrawalAmount = inputNum;
      }
    }
    if(input == null) print('Invalid Input');
  }while(input == null);


  try{
    bankAccount.withdraw(withdrawalAmount);
  }on InsufficientFundsError {
    print('Error: Insufficient funds');
  }finally{
    print(bankAccount.getBalance);
  }


}