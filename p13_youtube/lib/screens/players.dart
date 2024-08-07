import 'package:flutter/material.dart';

class SongPlayer extends StatefulWidget {
  late String artWorkUrl;
  late String trackName;
  late String artistName;
  late String previewUrl;
  SongPlayer(
      {required this.artWorkUrl,
      required this.artistName,
      required this.previewUrl,
      required this.trackName,
      super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(widget.artWorkUrl),
          ),
          Text(
            widget.trackName,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(widget.artistName),
          Slider(value: 1, onChanged: (value) {}),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.no_accounts)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.skip_previous)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
            ],
          )
        ],
      ),
    ));
  }
}
