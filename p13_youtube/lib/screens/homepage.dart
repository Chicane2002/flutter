import 'package:flutter/material.dart';
import 'package:p13_youtube/services/videoClient.dart';
import 'package:p13_youtube/services/videoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoClient vidCl = VideoClient();

  // AudioPlayer audioplayers = AudioPlayer(); //Audio player object

  Future<List<VidModel>> getVideosFromAPI() async {
    // ignore: unused_local_variable
    Map<String, dynamic> cMap = await vidCl.getVidsFromYT();
    List<dynamic> sList = cMap['results'];
    List<VidModel> finalVidList = toSongModel(sList);
    return finalVidList;
  }

  toSongModel(List<dynamic> list) {
    List<VidModel> convertedSongs = list.map((singleObject) {
      VidModel sModel = VidModel.fromJSON(singleObject);
      return sModel;
    }).toList();
    return convertedSongs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(children: [
      //     Text('Home'),
      //     TextButton(
      //         onPressed: () {
      //           vidCl.getVidsFromYT();
      //         },
      //         child: Text("Get songs"))
      //   ],
      // ),
      FutureBuilder(
          future: getVideosFromAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'snapshot has encounteredd error: ${snapshot.error.toString()}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VideoPlayer(
                                    artWorkUrl:
                                        snapshot.data![index].artworkUrl100,
                                    artistName:
                                        snapshot.data![index].artistName,
                                    previewUrl:
                                        snapshot.data![index].previewURL,
                                    trackName:
                                        snapshot.data![index].trackName)));
                      },
                      leading:
                          Image.network(snapshot.data![index].artworkUrl100),
                      title: Text(snapshot.data![index].trackName),
                      subtitle: Text(snapshot.data![index].artistName),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.play_arrow)),
                    );
                  });
              // return const Center(
              //   child: Text("SUCCESS"),
              // );
            }
            return const Placeholder();
          })
    ]))));
  }
}
