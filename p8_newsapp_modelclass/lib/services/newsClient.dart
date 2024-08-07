import 'package:dio/dio.dart';

class NewsClient {
  Dio dio = Dio();
  getNewsDataFromAPI() async {
    String newsURL =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=d157bc9325524f91ae4abe6fc7cf7354';
    try {
      var response = await dio.get(newsURL);
      print('The response recieved here is ${response.data}');
      return response.data; //articles has type list
    } catch (error) {
      print('Error encountered: $error');
    }
  }
}
