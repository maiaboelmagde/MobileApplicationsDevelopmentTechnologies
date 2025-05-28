mixin WiFiEnabled{
  connectWiFi()async{
    print('Connecting to HomeNetwork...');
    await Future.delayed(Duration(seconds: 2));
    print('Connected. IP: 192.168.1.101');
  }
}