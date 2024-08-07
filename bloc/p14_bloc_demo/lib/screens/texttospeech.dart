import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTS_Demo extends StatefulWidget {
  const TTS_Demo({super.key});

  @override
  State<TTS_Demo> createState() => _TTS_DemoState();
}

class _TTS_DemoState extends State<TTS_Demo> {
  @override
  FlutterTts ttss = FlutterTts();
  speak(String data) async {
    List languages = await ttss.getLanguages;
    await ttss.setLanguage('en-US');
    await ttss.speak(data);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {
              speak("This is a Flutter Demo.");
            },
            child: const Text('Start TTS service.'),
          ),
        ],
      )),
    );
  }
}
