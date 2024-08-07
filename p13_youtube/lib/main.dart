import 'package:flutter/material.dart';
import 'package:p13_youtube/screens/homepage.dart';
import 'package:p13_youtube/screens/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const HomePage(), // we have named this route now
    },
  ));
}
// api key for youtube AIzaSyBY5bbzflQumHGzCyUdtcOjJr-6BBUdkng
//link with key https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=200&regionCode=IN&key=AIzaSyBY5bbzflQumHGzCyUdtcOjJr-6BBUdkng