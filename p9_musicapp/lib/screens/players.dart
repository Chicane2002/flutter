import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../services/songModel.dart';

// class SongPlayer extends StatefulWidget {
//   late String artWorkUrl;
//   late String trackName;
//   late String artistName;
//   late String previewUrl;
//   SongPlayer(
//       {required this.artWorkUrl,
//       required this.artistName,
//       required this.previewUrl,
//       required this.trackName,
//       super.key});

//   @override
//   State<SongPlayer> createState() => _SongPlayerState();
// }

// class _SongPlayerState extends State<SongPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Image.network(widget.artWorkUrl),
//           ),
//           Text(
//             widget.trackName,
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//           Text(widget.artistName),
//           Slider(value: 1, onChanged: (value) {}),
//           Row(
//             children: [
//               IconButton(onPressed: () {}, icon: const Icon(Icons.no_accounts)),
//               IconButton(
//                   onPressed: () {}, icon: const Icon(Icons.skip_previous)),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow)),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next)),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
//             ],
//           )
//         ],
//       ),
//     ));
//   }
// }

class SongPlayer extends StatefulWidget {
  late List<SongModel> fullList;
  late int currInd;
  late String artWorkUrl;
  late String trackName;
  late String artistName;
  late String previewUrl;

  SongPlayer({required this.fullList, required this.currInd, super.key});

  // SongPlayer(
  //     {required this.artWorkUrl,
  //     required this.artistName,
  //     required this.previewUrl,
  //     required this.trackName,
  //     super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  AudioPlayer songPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration fullDuration = Duration(seconds: 29);
  Duration currentDuration = Duration(seconds: 0);

  int elapsed = 0;

  getSongDetails() {
    songPlayer.onDurationChanged.listen((Duration fDuration) {
      setState(() {
        fullDuration = fDuration;
      });
    });
    songPlayer.onPositionChanged.listen((Duration cDuration) {
      setState(() {
        currentDuration = cDuration;
      });
    });
    songPlayer.onPlayerStateChanged.listen((state) {
      state = PlayerState.completed;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSongDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.network(
              widget.fullList[widget.currInd].artworkUrl100,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.fullList[widget.currInd].trackName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.fullList[widget.currInd].artistName,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Row(
            children: [
              Text(currentDuration.inSeconds.toString()),
              Expanded(
                child: Slider(
                  value: (currentDuration.inMilliseconds <
                          fullDuration.inMilliseconds
                      ? (currentDuration.inMilliseconds /
                          fullDuration.inMilliseconds)
                      : 1),
                  onChanged: (value) {
                    int reqDuration = (value * fullDuration.inSeconds).toInt();
                    songPlayer.seek(Duration(seconds: reqDuration));
                  },
                ),
              ),
              Text(fullDuration.inSeconds.toString()),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.no_accounts)),
              IconButton(
                  onPressed: () {
                    print("currInd: ${widget.currInd}");
                    widget.currInd =
                        (widget.currInd - 1) % widget.fullList.length;
                    // songPlayer.play(
                    //     UrlSource(widget.fullList[widget.currInd].previewUrl));
                    //  [0, 1, 2, 3, 4]
                    setState(() {});
                  },
                  icon: Icon(Icons.skip_previous)),
              IconButton(
                onPressed: () {
                  isPlaying = !isPlaying;
                  isPlaying &&
                          currentDuration.inSeconds < fullDuration.inSeconds
                      ? songPlayer.play(
                          UrlSource(widget.fullList[widget.currInd].previewURL))
                      : songPlayer.pause();
                  setState(() {});
                },
                icon: isPlaying &&
                        currentDuration.inSeconds < fullDuration.inSeconds
                    ? Icon(
                        Icons.pause,
                        size: 80,
                      )
                    : Icon(
                        Icons.play_arrow,
                        size: 80,
                      ),
              ),
              IconButton(
                  onPressed: () {
                    print("currInd: ${widget.currInd}");
                    widget.currInd =
                        (widget.currInd + 1) % widget.fullList.length;
                    // songPlayer.play(
                    //     UrlSource(widget.fullList[widget.currInd].previewUrl));
                    setState(() {});
                  },
                  icon: Icon(Icons.skip_next)),
              IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
            ],
          )
        ],
      ),
    ));
  }
}
