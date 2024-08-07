import 'dart:convert';

import 'package:dio/dio.dart';

class SongClient {
  final Dio _dioClient = Dio();

  getSongsFromITunes() async {
    try {
      String iTunesURL =
          "https://itunes.apple.com/search?term=arijit singh&limit=25"; //replace jack with arijit and johnson with singh for downloading file for him instead

      var resp = await _dioClient.get(iTunesURL);
      print('The response here is $resp');

      Map<String, dynamic> songMap = jsonDecode(resp.data);
      return songMap;
    } catch (error) {
      print('Some error has occurred: $error');
    }
  }
}
