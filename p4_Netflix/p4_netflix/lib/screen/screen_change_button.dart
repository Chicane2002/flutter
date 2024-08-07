import 'package:flutter/material.dart';

import 'Comingsoon.dart';
import 'Downloads.dart';
import 'Home_Page.dart';
import 'More.dart';
import 'Search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndexs = 0;
  final List screens = [
    const Home_Page(),
    const Search(),
    const Download(),
    const More(),
    const ComingSoon(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Image.asset(
            "assets/netflix_logo0.png",
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 8.0, left: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "TV Shows",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, right: 8.0, left: 8.0),
              child: Text(
                "Movies",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 13.0, left: 0, right: 0),
              child: OutlinedButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                child: Text(
                  "My List",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: screens[currentIndexs],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndexs,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndexs = value;
              });
            },
            backgroundColor: Colors.black,
            selectedItemColor: Color.fromARGB(255, 243, 143, 143),
            unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            selectedFontSize: 13,
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "Search", icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: "Downloads", icon: Icon(Icons.download)),
              BottomNavigationBarItem(label: "List", icon: Icon(Icons.menu)),
              BottomNavigationBarItem(
                  label: "Settings", icon: Icon(Icons.settings)),
            ]),
      ),
    );
  }
}
