class NewsModel {
  late Source source; //String? b; needs to be initialised. This doesn't.
  late String author;
  late String title;
  late String decription;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  NewsModel(
      //only task is to get news data from json file
      {required this.source,
      required this.author,
      required this.title,
      required this.decription,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  NewsModel.extractFromJson(Map<String, dynamic> map) {
    source = Source.extractFromJson2(map['source']);
    author =
        map['author'] ?? "not available"; // means if null then put this value
    title = map['title'] ?? "not available";
    url = map['url'] ?? "not available";
    decription = map['decription'] ?? "not available";
    urlToImage = map['urlToImage'] ?? "not available";
    publishedAt = map['publishedAt'] ?? "not available";
    content = map['content'] ?? "not available"; // put https image something
  }
}

class Source {
  late String id;
  late String name;
  Source({required this.id, required this.name});
  Source.extractFromJson2(Map<String, dynamic> map) {
    id = map["id"] ?? "not available"; // means if null then put this value
    name = map["name"] ?? "not available";
  }
}
