# Import JS Library

Import & use javascript libraries in your flutter web projects.

Created to make it simpler to build Flutter Plugins compatible with web.

# Example

to include [howler.js](https://github.com/goldfire/howler.js) & use it in a flutter web project :

1. Add the js library in your assets
2. Declare it inside your pubspec.yaml

```dart
flutter:
  assets:
    - assets/howler.js
```

3. Anywhere in your Flutter project, import this js lib
 
For example, on the main.dart

```dart
void main() {
  importJsLibrary("./assets/howler.js");
  runApp(MyApp());
}
```

You can also import it later in a custom class.

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






