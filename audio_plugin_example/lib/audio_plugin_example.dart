
import 'dart:async';

import 'package:flutter/services.dart';

class AudioPluginExample {
  static const MethodChannel _channel =
      const MethodChannel('audio_plugin_example');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
