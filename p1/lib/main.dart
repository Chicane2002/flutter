import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        // theme: ThemeData.dark(),
        home: Scaffold(
            appBar: AppBar(
              // leading: const Icon(Icons.battery_1_bar),
              leading: const Row(
                // Displays icons before the title.Otherwise always on the right
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.search),
                ],
              ),
              title: const Text(
                "YouTube",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
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
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 10),
                          // border: Border.all(width: 20),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13))),
                      child: Column(
                        children: [
                          Image.asset("assets/merci1.jpeg"),
                          Text("Murcielago"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    )
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          color: Color.fromARGB(255, 243, 16, 0),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Container(
                            height: 200,
                            width: 250,
                            color: Color.fromARGB(255, 100, 83, 159),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 100,
                            width: 25,
                            color: Color.fromARGB(214, 132, 246, 151),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            width: 25,
                            color: Color.fromARGB(214, 132, 246, 151),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Row(),
                const Row()
              ],
            ))),
  );
}
