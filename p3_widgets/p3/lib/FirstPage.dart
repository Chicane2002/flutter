import 'ItemContainer.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.battery_1_bar),
          leading: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.search),
            ],
          ),
          title: const Text(
            "YouTube",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          centerTitle: true,
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.video_call),
            Icon(Icons.add)
          ],
        ),
        // body: const Center(child: Text('HELLO THIS IS FLUTTER')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ItemContainer(textData: "red", contcolor: Colors.red),
                ItemContainer(textData: "blue", contcolor: Colors.blue),
                ItemContainer(textData: "green", contcolor: Colors.green)
              ],
            ),
            Row(
              children: [
                ItemButton(buttoncolor: Colors.red, Icond: Icons.add),
                ItemButton(buttoncolor: Colors.blue, Icond: Icons.mail),
                ItemButton(buttoncolor: Colors.green, Icond: Icons.mic)
              ],
            )
          ],
        ));
  }
}
