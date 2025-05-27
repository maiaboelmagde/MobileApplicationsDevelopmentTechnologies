import 'dart:io';

void main(){
  stdout.write('Enter scores (comma-separated): ');
  String? input = stdin.readLineSync();
  if(input != null && input.isNotEmpty){
    List<String> splitedInput = input.split(',');
    Set<int> numbers = {};
    for(int i = 0; i<splitedInput.length; i++){
      int? curInput = int.tryParse(splitedInput[i]);
      if(curInput == null){
        print('"${splitedInput[i]}" is Invalid numder !!');
      }else{
        numbers.add(curInput);
      }
    }

    List<int> numderHightThan80 = numbers.toList().where((num)=>num>80).toList();
    if(numderHightThan80.length > 0 ) {
      stdout.write('Unique high scores: ');
      print(numderHightThan80);
    }else{
      print('scores greater than 80 ');
    }
  }else{
    print('Empty Input !!');
  }
}