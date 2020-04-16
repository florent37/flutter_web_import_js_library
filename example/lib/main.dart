import 'package:audio_plugin_example/audio_plugin.dart';
import 'package:flutter/material.dart';

void main() {
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
              Expanded(flex: 1, child: AudioPage("./assets/test.mp3")),
              Expanded(flex: 1, child: AudioPage("./assets/astronomia.mp3")),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPage extends StatelessWidget {
  final String audioPath;

  AudioPage(this.audioPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(this.audioPath),
        RaisedButton(
          child: Text('Open'),
          onPressed: () {
            Audio.open(this.audioPath);
          },
        ),
        RaisedButton(
          child: Text('Play'),
          onPressed: () {
            Audio.play();
          },
        ),
        RaisedButton(
          child: Text('Pause'),
          onPressed: () {
            Audio.pause();
          },
        ),
      ],
    );
  }
}
