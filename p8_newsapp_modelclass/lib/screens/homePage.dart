import 'package:flutter/material.dart';
import 'package:p8_newsapp_modelclass/services/newsClient.dart';
import 'package:p8_newsapp_modelclass/services/newsModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsClient nClient = NewsClient();
  List<dynamic> nList = [];

  Future<List<NewsModel>> getNews() async {
    Map<String, dynamic> m1 = await nClient.getNewsDataFromAPI();

    List<dynamic> nList = m1['articles'];
    List<NewsModel> newList = genericToSpecificObject(nList);
    return newList;
  }

  genericToSpecificObject(List<dynamic> list) {
    List<NewsModel> newsList = list.map((singleObject) {
      NewsModel singleNews = NewsModel.extractFromJson(singleObject);
      return singleNews;
    }).toList();
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 175, 0, 0),
          title: Text("News App"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.replay)),
            )
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 255, 91, 91),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: getNews(),
              builder: (context, snapshot) {
                // snapshot gets the data from json file
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        'Snapshot has error. ${snapshot.error.toString()}'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          //tileColor: Colors.green,
                          title: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                                color: Color.fromARGB(255, 205, 207, 206),
                                elevation: 25,
                                child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(children: [
                                      Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          snapshot.data![index].title),
                                      Image.network(
                                        snapshot.data![index].urlToImage,
                                      ),
                                      Text(
                                        snapshot.data![index].decription,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        snapshot.data![index].url,
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                252, 39, 94, 197)),
                                      )
                                    ]))),
                          ),
                        );
                      });
                }
                return Container();
              }), //builds data as it is recieved
        ),
      ),
    );
  }
}
