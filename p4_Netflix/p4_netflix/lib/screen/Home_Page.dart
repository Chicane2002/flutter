import 'package:flutter/material.dart';
import 'package:p4_netflix/screen/My_List.dart';
import 'package:p4_netflix/screen/preveiw.dart';

import 'nf_Stack.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: Image.asset(
        //     "assets/netflix_logo0.png",
        //   ),
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.only(
        //           top: 16.0, bottom: 16.0, right: 8.0, left: 8.0),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: Text(
        //           "TV Shows",
        //           style: TextStyle(
        //             fontSize: 17,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(
        //           top: 16.0, bottom: 16.0, right: 8.0, left: 8.0),
        //       child: Text(
        //         "Movies",
        //         style: TextStyle(
        //           fontSize: 17,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //     //
        //     Padding(
        //       padding: const EdgeInsets.only(
        //           top: 8.0, bottom: 13.0, left: 0, right: 0),
        //       child: OutlinedButton(
        //         onPressed: () {},
        //         // ignore: prefer_const_constructors
        //         child: Text(
        //           "My List",
        //           style: const TextStyle(
        //             fontSize: 17,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // bottomNavigationBar:
        //     BottomNavigationBar(backgroundColor: Colors.black, items: [
        //   BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        //   BottomNavigationBarItem(label: "Back", icon: Icon(Icons.arrow_back)),
        // ]),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.black,
            width: double.infinity,
            //height: double.infinity,
            child: const Column(
              children: [MyStack(), PREVEIW(), MYLI()],
            ),
          ),
        ),
      ),
    );
  }
}
