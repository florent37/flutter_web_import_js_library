import 'dart:async';
import 'dart:html';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:import_js_library/import_js_library.dart';

import 'howl.dart';

/// Web AudioPlugin
class AudioPlugin {

  AudioPlugin(){
    importJsLibrary("./assets/packages/audio_plugin_example/assets/howler.js");
  }

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'audio_plugin',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    final AudioPlugin instance = AudioPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Howl howl;

  void open(String path){
    howl = Howl(src: [path]);
  }

  void play(){
    if(howl != null){
      howl.play();
    }
  }

  void pause(){
    if(howl != null){
      howl.pause();
    }
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    print(call.method);
    switch (call.method) {
      case "play":
        play();
        return Future.value(true);
        break;
      case "pause":
        pause();
        return Future.value(true);
        break;
      case "open":
        final String path = call.arguments["path"];
        open(path);
        return Future.value(true);
        break;
    }
  }
}
