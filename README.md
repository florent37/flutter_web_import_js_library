# Import JS Library

Import & use javascript libraries in your flutter web projects.

```dart
flutter:
  assets:
    - assets/howler.js
```

```dart
importJsLibrary(url: "./assets/howler.js", flutterPluginName: "audio_plugin_example");
```

# Why

[![meme](./meme/meme_pc_grid.png)]()

Audio library compatible with Flutter Web : (https://pub.dev/packages/assets_audio_player

[![meme](./meme/meme_idea_quote.png)]()

Howler.js : https://howlerjs.com/


Created to make it simpler to build Flutter Plugins compatible with web.

# Example


1. Create your plugin Package

```sh
flutter create --template=package audio_plugin_example
```

Then

2. Add the js library in your assets
3. Declare it inside your pubspec.yaml

```dart
flutter:
  assets:
    - assets/howler.js
```

3. In your Flutter plugin project, import this js lib
 
For example, on the registerWith()

pluginName: the name of your plugin, based on pubspecs.yaml, here `audio_plugin_example`

```dart
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
   
  ...
```

4. Using [package:js](https://pub.dev/packages/js), wrap your js methods/classes

```dart
@JS()
library howl.js;

import 'package:js/js.dart';

@JS("Howl")
class Howl {
  external Howl({List<String> src}); 

  external play();
}
```

5. Use your library !

```dart
final audio = Howl(src: ["./assets/astronomia.mp3"]);
audio.play();
```

for example in the plugin

```dart

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
```








