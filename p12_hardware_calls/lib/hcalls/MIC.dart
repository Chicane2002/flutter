import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Mic extends StatefulWidget {
  const Mic({super.key});

  @override
  State<Mic> createState() => _MicState();
}

class _MicState extends State<Mic> {
  @override
  void initState() {
    super.initState();
    initialiseMic();
  }

  initialiseMic() async {
    PermissionStatus micPermission = await Permission.microphone.request();
    if (micPermission.isGranted) {
      await _speech.initialize();
    } else if (micPermission.isDenied) {
      print('Mic permission denied.');
    } else if (micPermission.isPermanentlyDenied) {
      print('Mic permission permanently denied.');
      await openAppSettings();
    }
  }

  startMic() {
    _speech.listen(onResult: (ListenValue) {
      setState(() {
        micData = ListenValue.recognizedWords;
      });
    });
  }

  String micData = '';
  final SpeechToText _speech = SpeechToText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("This is data from mic: $micData "),
          // Text("Longitude: $longitude "),
          OutlinedButton(
              onPressed: () {
                startMic();
              },
              child: Text('Start Listening '))
        ]),
      ),
    );
  }
}
