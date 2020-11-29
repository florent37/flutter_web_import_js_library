import 'package:flutter/services.dart';

class Audio {
  static const MethodChannel _channel = const MethodChannel('audio_plugin');

  static void open(String path) async {
    await _channel.invokeMethod('open', {
      "path": path,
    });
  }

  static void play() async {
    await _channel.invokeMethod('play');
  }

  static void pause() async {
    await _channel.invokeMethod('pause');
  }
}
