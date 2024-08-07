import 'package:dio/dio.dart';

class DictClient {
  Dio dict = Dio();
  searchForward(String? query) async {
    String dictURL = "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    try {
      var response = await dict.get(dictURL);
      String meaning = response.data[0]['meanings'][0]['definitions'][0]
              ['definition']
          .toString();
      print('This is the response from API ${meaning}');
      return meaning;
    } catch (error) {
      print('Some error was encountered in Network call: $error');
    }
  }
}
