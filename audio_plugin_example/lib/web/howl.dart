@JS()
library howl.js;

import 'package:js/js.dart';

//just a wrapper of the HowlJs
//to maintain this element not modified by @Js methods
class Howl {
  final HowlJs howl;

  Howl({List<String> src, bool autoPlay = false})
      : howl = HowlJs(HowlParams(
          src: src,
          autoplay: autoPlay,
        ));

  void play() => howl.play();

  void pause() => howl.pause();

  void stop() => howl.stop();

  void seek(dynamic seek) => howl.seek(seek);

  void mute(bool mute) => howl.mute(mute);

  bool get playing => howl.playing;

  double volume([double volume]) => howl.volume(volume);

  double get duration => howl.duration;

  void on(String event, Function callback) => howl.on(event, allowInterop(callback));

  void onLoad(Function(dynamic id) callback) => on("load", (id, _) {
        callback(id); //exclude the second param
      });

  void onPlay(Function(dynamic id) callback) => on("play", (id, _) {
        callback(id); //exclude the second param
      });

  void onPause(Function(dynamic id) callback) => this.on("pause", (id, _) {
        callback(id); //exclude the second param
      });

  void onStop(Function(dynamic id) callback) => on("stop", (id, _) {
        callback(id); //exclude the second param
      });

  void onEnd(Function(dynamic id) callback) => on("end", (id, _) {
        callback(id); //exclude the second param
      });
}

//this class contains only Howl Javascript methods
@JS("Howl")
class HowlJs {
  external HowlJs(HowlParams params); //initializer

  external play();

  external pause();

  external stop();

  external seek(dynamic seek);

  external mute(bool mute);

  external bool get playing;

  external double volume([double volume]);

  external double get duration;

  external HowlJs on(String event, Function fn, [dynamic id = ""]);
}

@JS()
@anonymous
class HowlParams {
  external factory HowlParams({List<String> src, bool autoplay = false});
}
