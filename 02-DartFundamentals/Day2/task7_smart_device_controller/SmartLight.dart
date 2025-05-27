import 'WiFiEnabled.dart';

class SmartLight with WiFiEnabled{
  lightOn()async{
    await connectWiFi();
    print('SmartLight is ON');
  }
}