import 'dart:io';

bool isPalindrome(String text){
  bool isPalindrome = true;
  text = text.replaceAll(' ', '').toLowerCase();
  for(int i = 0; i < text.length/2; i++){
    if(text[i]!= text[text.length-i-1]){
      isPalindrome = false;
      break;
    }
  }

  return isPalindrome;
}

void main(List<String> arguments) {
  bool exit = false;

  while(!exit){
    stdout.write("Enter a String (or 'exit' to quit):  ");
    String? input = stdin.readLineSync();
    if(input != null && input.isNotEmpty){
      if(input == 'exit'){
        exit = true;
        continue;
      }

      print('"$input" is a palindrome: ${isPalindrome(input)}');
    }else{
      print("String can't be empty ...");
    }
  }
}
