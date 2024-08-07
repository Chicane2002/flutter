import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(children: [
              Chip(
                surfaceTintColor: Color.fromARGB(255, 197, 135, 135),
                avatar: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("🍕"), //press 'windows'+'.' to access emojis
                ),
                label: Text('Pizza'),
              ),
              Chip(
                surfaceTintColor: Color.fromARGB(255, 197, 135, 135),
                avatar: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("🍕"), //press 'windows'+'.' to access emojis
                ),
                label: Text('Pizza'),
              ),
              Chip(
                surfaceTintColor: Color.fromARGB(255, 197, 135, 135),
                avatar: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("🍕"), //press 'windows'+'.' to access emojis
                ),
                label: Text('Pizza'),
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                children: [
                  ListTile(
                    tileColor: Color.fromARGB(255, 95, 255, 161),
                    shape: const CircleBorder(
                      eccentricity: 1,
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    tileColor: Color.fromARGB(255, 255, 162, 95),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
