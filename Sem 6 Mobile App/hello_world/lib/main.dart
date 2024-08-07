import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    );
  }
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("welcome to flutter !!"),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello, Gurmehar Singh here.",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: Text("click me"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
