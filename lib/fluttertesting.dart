import 'dart:async';

import 'package:flutter/services.dart';

class Fluttertesting {
  static const MethodChannel _channel =
      const MethodChannel('fluttertesting');

  static Future<String> get getDownloadsDirPath async{
    String path;
    try{
      path = await _channel.invokeMethod('getDownloadsDirPath');
    }catch(e){
      print(e);
      path = "UNKNOWN";
    }
    return path;
  }

}
