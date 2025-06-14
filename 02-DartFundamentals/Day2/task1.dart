import 'dart:io';

void main(){
  stdout.write("Enter names (comma-separated):");
  String? input =stdin.readLineSync();
  print(input);
  if(input != null && input.isNotEmpty){
    List<String> names = input.split(',');
    names = names.map((name)=>name[0].toUpperCase()+name.substring(1)).toList();
    stdout.write('Capitalized: ');
    print(names);

    List<String> namesStartsWithA = names.where((name)=>name[0] =='A').toList();

    stdout.write('Names starting with A: ');
    print(namesStartsWithA);
  }else{
    print('Invalid Input !!');
  }
}
