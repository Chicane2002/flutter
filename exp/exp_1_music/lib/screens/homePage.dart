import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:harmonica/screens/players.dart';
import 'package:harmonica/services/songClient.dart';
import 'package:harmonica/services/songModel.dart';

class Home extends StatefulWidget {
  String? artistName;
  Home({this.artistName = "maroon 5", super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController tcf = TextEditingController();
  int Playing = -1;
  bool isPlaying = false;
  SongClient sClient = SongClient();
  late Future<List<SongModel>> _futureSongs;

  // Creating AudioPlayer object
  AudioPlayer audioPlayer = AudioPlayer();

  Future<List<SongModel>> _getSongsFromServer() async {
    Map<String, dynamic> sMap =
        await sClient.getSongs(artistName: widget.artistName!);
    List<dynamic> sList = sMap["results"];
    List<SongModel> songs = _genericToSpecific(sList);
    return songs;
  }

  _genericToSpecific(List<dynamic> data) {
    List<SongModel> sModels = data.map((d) {
      SongModel sModel = SongModel.extractData(d);
      return sModel;
    }).toList();
    return sModels;
  }

  // use initstate to load th things when the page gets loaded just like the desired music
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureSongs = _getSongsFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Harmonica",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.amber[50],
            centerTitle: true,
          ),
          body: Container(
            child: FutureBuilder(
                future: _futureSongs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "ERROR: ${snapshot.error.toString()}",
                        style: TextStyle(color: Colors.pink),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SongPlayer(
                                            currInd: index,
                                            fullList: snapshot.data!,
                                          )

                                      // SongPlayer(
                                      //     artWorkUrl: snapshot
                                      //         .data![index].artworkUrl100,
                                      //     artistName:
                                      //         snapshot.data![index].artistName,
                                      //     previewUrl:
                                      //         snapshot.data![index].previewUrl,
                                      //     trackName: snapshot
                                      //         .data![index].trackName
                                      //         )
                                      ));
                            },
                            leading: Image.network(
                                snapshot.data![index].artworkUrl100),
                            title: Text(snapshot.data![index].trackName),
                            subtitle: Text(snapshot.data![index].artistName),
                            trailing: IconButton(
                                onPressed: () {
                                  // isPlaying
                                  //     ? audioPlayer.pause()
                                  //     : audioPlayer.play(UrlSource(
                                  //         snapshot.data![index].previewUrl));

                                  // perfect switchin using Playing

                                  Playing = Playing == -1 ? index : -1;
                                  Playing == -1
                                      ? audioPlayer.pause()
                                      : audioPlayer.play(UrlSource(
                                          snapshot.data![index].previewUrl));

                                  // isPlaying = !isPlaying;

                                  // Playing = Playing == -1 ? index : -1;
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => SongPlayer(
                                  //             artWorkUrl: snapshot
                                  //                 .data![index].artworkUrl100,
                                  //             artistName: snapshot
                                  //                 .data![index].artistName,
                                  //             previewUrl: snapshot
                                  //                 .data![index].previewUrl,
                                  //             trackName: snapshot
                                  //                 .data![index].trackName)));
                                  setState(() {});
                                },
                                // icon: isPlaying
                                //     ? Icon(Icons.pause)
                                //     : Icon(Icons.play_arrow_rounded)),
                                icon: Playing >= 0 && Playing == index
                                    ? Icon(Icons.pause)
                                    : Icon(Icons.play_arrow_rounded)),
                          );
                        });
                  }
                  return Text("default");
                }),
          )),
    );
  }
}
