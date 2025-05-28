import 'dart:io';

import 'SmartLight.dart';
import 'SmartSpeaker.dart';

void main() async{
  bool exitFlag = false;
  while (!exitFlag) {

    stdout.write('Enter command (e.g., "light on", "speaker play Jazz", "exit"):');
    String? input=stdin.readLineSync();

    switch (input) {
      case "light on":
        await SmartLight().lightOn();;
        break;
      case "speaker play Jazz":
        await SmartSpeaker().playSpeaker();
        break;
      case "exit":
        exitFlag = true;
        break;
      default:
        print('Invalid command !!');
    }
    
  }
}
