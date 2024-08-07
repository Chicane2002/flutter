import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirstLoadingScreenShow = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // sets the new state
      isFirstLoadingScreenShow = false;
      setState(() {});
      if (isFirstLoadingScreenShow == false) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFirstLoadingScreenShow // basically like an if else block, ? is true and : is false or else
        ? SafeArea(
            // when true
            child: Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Youtube Start')
                        //Image.asset('assets/amazon_music_logo_GIF.png'),
                        ),
                    const CircularProgressIndicator(),
                  ]),
            ),
          )
        : SafeArea(
            // used when false
            child: Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Youtube')
                        //Image.asset('assets/image3.png'),
                        ),
                  ]),
            ),
          );
  }
}
