import 'dart:convert';

import 'package:dio/dio.dart';

class VideoClient {
  final Dio _dioClient = Dio();

  getVidsFromYT() async {
    try {
      String YTURL =
          "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=200&regionCode=IN&key=AIzaSyBY5bbzflQumHGzCyUdtcOjJr-6BBUdkng";

      var resp = await _dioClient.get(YTURL);
      print('The response here is $resp');

      Map<String, dynamic> vidMap = jsonDecode(resp.data);
      return vidMap;
    } catch (error) {
      print('Some error has occurred: $error');
    }
  }
}
