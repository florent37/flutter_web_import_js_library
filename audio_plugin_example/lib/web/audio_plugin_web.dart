import 'dart:async';
import 'dart:html';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:import_js_library/import_js_library.dart';

import 'howl.dart';

/// Web AudioPlugin
class AudioPlugin {

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'audio_plugin',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    importJsLibrary(url: "./assets/howler.js", pluginName: "audio_plugin_example");

    final AudioPlugin instance = AudioPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Howl audio;

  Future<dynamic> handleMethodCall(MethodCall call) async {
    print(call.method);
    switch (call.method) {
      case "play":
        if(audio != null){
          audio.play();
        }
        break;
      case "pause":
        if(audio != null){
          audio.pause();
        }
        break;
      case "open":
        final String path = call.arguments["path"];
        audio = Howl(src: [path]);
        break;
    }
  }
}
