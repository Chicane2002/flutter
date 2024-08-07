import 'package:flutter/material.dart';
import 'package:p9_musicapp/screens/homepage.dart';
import 'package:p9_musicapp/screens/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    //home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => Home(), // we have named this route now
    },
  ));
}
