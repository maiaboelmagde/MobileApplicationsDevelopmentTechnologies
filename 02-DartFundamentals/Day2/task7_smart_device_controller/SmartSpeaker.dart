import 'VoiceControl.dart';
import 'WiFiEnabled.dart';

class SmartSpeaker with VoiceControl, WiFiEnabled{
  playSpeaker()async{
    await connectWiFi();
    voiceOn();
  }
}