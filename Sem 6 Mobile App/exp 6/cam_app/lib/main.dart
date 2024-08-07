import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(AudioPlayerApp());
}

class AudioPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player',
      home: AudioPlayerPage(),
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => playAudio('audio.mp3'),
                    child: Text('Play Audio'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () => stopAudio(),
                    child: Text('Stop Audio'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void playAudio(String audioPath) async {
    await audioPlayer.setUrl(audioPath);
    audioPlayer.play();
  }

  void stopAudio() async {
    await audioPlayer.stop();
  }
}
