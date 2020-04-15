import 'package:flutter/material.dart';

import 'package:import_js_library/import_js_library.dart';
import 'howl.dart';

void main() {
  importJsLibrary("./assets/howler.js");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: AudioPage("./assets/test.mp3")
              ),
              Expanded(
                  flex: 1,
                  child: AudioPage("./assets/astronomia.mp3")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPage extends StatefulWidget {
  final String audioPath;

  AudioPage(this.audioPath);

  @override
  createState() => _AudioPage();
}

class _AudioPage extends State<AudioPage> {
  Howl audio;

  void play() {
    if (audio == null) {
      audio = Howl(src: [this.widget.audioPath]);

      audio.onPause((id){
        print("onpause $id");
      });

      audio.onPlay((id){
        print("onplay $id");
      });

      audio.onEnd((id){
        print("onEnd $id");
      });
    }
    audio.play();
  }

  void pause() {
    audio?.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.audioPath),
        RaisedButton(
          child: Text('Play'),
          onPressed: () {
            play();
          },
        ),
        RaisedButton(
          child: Text('Pause'),
          onPressed: () {
            pause();
          },
        ),
        RaisedButton(
          child: Text('seek To 5s'),
          onPressed: () {
            audio?.seek(5);
          },
        ),
        RaisedButton(
          child: Text('volume=0.5'),
          onPressed: () {
            audio?.volume(0.5);
          },
        ),
        RaisedButton(
          child: Text('volume=1.0'),
          onPressed: () {
            audio?.volume(1.0);
          },
        ),
        RaisedButton(
          child: Text('print volume'),
          onPressed: () {
            print("volume: ${audio?.volume()}");
          },
        ),
      ],
    );
  }
}
