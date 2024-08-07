// ignore_for_file: library_private_types_in_public_api
import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(FlutterPiano());
}

class FlutterPiano extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Piano Al Volo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFFCC9704)),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(248, 19, 216, 190),
        appBar: AppBar(
          title: const Text('Piano Al Volo'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('piano_bg.jpg'),
              fit: BoxFit
                  .cover, // Adjust the fit based on your image aspect ratio
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PianoCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class PianoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 1000,
      child: Center(
        child: Card(
          color: const Color.fromARGB(255, 177, 14, 14),
          elevation: 40.0,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: FlutterPianoScreen(),
          ),
        ),
      ),
    );
  }
}

class FlutterPianoScreen extends StatefulWidget {
  @override
  _FlutterPianoScreenState createState() => _FlutterPianoScreenState();
}

class _FlutterPianoScreenState extends State<FlutterPianoScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final FocusNode _focusNode = FocusNode();

  void _readTone(String tone) {
    assetsAudioPlayer.open(
      Audio("assets/notes/$tone.mp3"),
    );
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.keyZ) {
        _readTone('C');
      } else if (event.logicalKey == LogicalKeyboardKey.keyX) {
        _readTone('D');
      } else if (event.logicalKey == LogicalKeyboardKey.keyC) {
        _readTone('E');
      } else if (event.logicalKey == LogicalKeyboardKey.keyV) {
        _readTone('F');
      } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
        _readTone('G');
      } else if (event.logicalKey == LogicalKeyboardKey.keyN) {
        _readTone('A');
      } else if (event.logicalKey == LogicalKeyboardKey.keyM) {
        _readTone('B');
      } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
        _readTone('Db');
      } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
        _readTone('Eb');
      } else if (event.logicalKey == LogicalKeyboardKey.keyG) {
        _readTone('Gb');
      } else if (event.logicalKey == LogicalKeyboardKey.keyH) {
        _readTone('Ab');
      } else if (event.logicalKey == LogicalKeyboardKey.keyJ) {
        _readTone('Bb');
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double whiteWidth = constraints.maxWidth / 7;
          double blackWidth = whiteWidth * 0.60;
          double keyHeight = constraints.maxHeight / 2;
          return RawKeyboardListener(
            autofocus: true,
            focusNode: _focusNode,
            onKey: _handleKeyEvent,
            child: Stack(
              fit: StackFit.expand,
              children: [
                whiteTile('C', 0, whiteWidth, keyHeight),
                whiteTile('D', 1, whiteWidth, keyHeight),
                whiteTile('E', 2, whiteWidth, keyHeight),
                whiteTile('F', 3, whiteWidth, keyHeight),
                whiteTile('G', 4, whiteWidth, keyHeight),
                whiteTile('A', 5, whiteWidth, keyHeight),
                whiteTile('B', 6, whiteWidth, keyHeight),
                blackTile('Db', 1, whiteWidth, blackWidth, keyHeight),
                blackTile('Eb', 2, whiteWidth, blackWidth, keyHeight),
                blackTile('Gb', 4, whiteWidth, blackWidth, keyHeight),
                blackTile('Ab', 5, whiteWidth, blackWidth, keyHeight),
                blackTile('Bb', 6, whiteWidth, blackWidth, keyHeight),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget whiteTile(
      String tone, double position, double whiteWidth, double keyHeight) {
    return Positioned(
      top: 0,
      left: position * whiteWidth,
      width: whiteWidth,
      bottom: 0,
      child: RawMaterialButton(
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        onPressed: () => _readTone(tone),
      ),
    );
  }

  Widget blackTile(String tone, double position, double whiteWidth,
      double blackWidth, double keyHeight) {
    return Positioned(
      top: 0,
      left: position * whiteWidth - blackWidth / 2,
      width: blackWidth,
      height: keyHeight,
      child: RawMaterialButton(
        fillColor: Colors.black,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        onPressed: () => _readTone(tone),
      ),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
