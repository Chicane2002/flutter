import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:p9_musicapp/screens/players.dart';
import 'package:p9_musicapp/services/songClient.dart';
import 'package:p9_musicapp/services/songModel.dart';

// class HomePage extends StatefulWidget {
// const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   SongClient songCl = SongClient();

//   AudioPlayer audioplayers = AudioPlayer(); //Audio player object

//   Future<List<SongModel>> getSongsFromAPI() async {
//     // ignore: unused_local_variable
//     Map<String, dynamic> cMap = await songCl.getSongsFromITunes();
//     List<dynamic> sList = cMap['results'];
//     List<SongModel> finalSongList = toSongModel(sList);
//     return finalSongList;
//   }

//   toSongModel(List<dynamic> list) {
//     List<SongModel> convertedSongs = list.map((singleObject) {
//       SongModel sModel = SongModel.fromJSON(singleObject);
//       return sModel;
//     }).toList();
//     return convertedSongs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Center(
//                 child:
//                     // Column(
//                     //   children: [
//                     //     Text('Home'),
//                     //     TextButton(
//                     //         onPressed: () {
//                     //           songCl.getSongsFromITunes();
//                     //         },
//                     //         child: Text("Get songs"))
//                     //   ],
//                     // ),
//                     FutureBuilder(
//                         future: getSongsFromAPI(),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return Center(
//                                 child: const CircularProgressIndicator());
//                           } else if (snapshot.hasError) {
//                             return Center(
//                                 child: Text(
//                                     'snapshot has encounteredd error: ${snapshot.error.toString()}'));
//                           } else if (snapshot.hasData) {
//                             return ListView.builder(
//                                 itemCount: snapshot.data!.length,
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (_) => SongPlayer(
//                                                   artWorkUrl: snapshot
//                                                       .data![index]
//                                                       .artworkUrl100,
//                                                   artistName: snapshot
//                                                       .data![index].artistName,
//                                                   previewUrl: snapshot
//                                                       .data![index].previewURL,
//                                                   trackName: snapshot
//                                                       .data![index]
//                                                       .trackName)));
//                                     },
//                                     leading: Image.network(
//                                         snapshot.data![index].artworkUrl100),
//                                     title:
//                                         Text(snapshot.data![index].trackName),
//                                     subtitle:
//                                         Text(snapshot.data![index].artistName),
//                                     trailing: IconButton(
//                                         onPressed: () {},
//                                         icon: const Icon(Icons.play_arrow)),
//                                   );
//                                 });
//                             // return const Center(
//                             //   child: Text("SUCCESS"),
//                             // );
//                           }
//                           return const Placeholder();
//                         }))));
//   }
// }
class Home extends StatefulWidget {
  String? artistName;
  Home({super.key});

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
    Map<String, dynamic> sMap = await sClient.getSongsFromITunes();
    List<dynamic> sList = sMap["results"];
    List<SongModel> songs = _genericToSpecific(sList);
    return songs;
  }

  _genericToSpecific(List<dynamic> data) {
    List<SongModel> sModels = data.map((d) {
      SongModel sModel = SongModel.fromJSON(d);
      return sModel;
    }).toList();
    return sModels;
  }

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
              "Amazon Music",
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
                                          )));
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
                                          snapshot.data![index].previewURL));
                                  setState(() {});
                                },
                                icon: Playing >= 0 && Playing == index
                                    ? Icon(Icons.pause)
                                    : Icon(Icons.play_arrow_rounded)),
                          );
                        });
                  }
                  return const Placeholder();
                }),
          )),
    );
  }
}
