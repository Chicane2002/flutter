import 'dart:convert';

import 'package:dio/dio.dart';

class SongClient {
  Dio _dio = Dio();

  getSongs({String artistName = "linkin park"}) async {
    String url = 'https://itunes.apple.com/search?term=${artistName}&limit=25';

    try {
      Response resp = await _dio.get(url);
      Map<String, dynamic> data = jsonDecode(resp.data);
      print("Response is: ${resp.data}");
      return data;
    } catch (error) {
      print("Found Error: $error");
    }
  }
}
