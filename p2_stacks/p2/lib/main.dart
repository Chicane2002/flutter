import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        // theme: ThemeData.dark(),
        home: Scaffold(
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
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.add)
              ],
            ),
            // body: const Center(child: Text('HELLO THIS IS FLUTTER')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 200,
                        width: 350,
                        color: Color.fromARGB(255, 153, 0, 255),
                        child: Center(
                          child: Text("Purple"),
                        )),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 220,
                        width: 150,
                        color: Color.fromARGB(255, 153, 0, 255),
                        child: Center(
                          child: Text("Purple"),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(children: [
                      newCont(
                          contColor: Color.fromARGB(255, 0, 251, 251),
                          textData: ("Purple"),
                          c_h: 150,
                          c_w: 150),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 150,
                          width: 150,
                          color: Color.fromARGB(255, 246, 51, 34),
                          child: Center(
                            child: Text("Red"),
                          ))
                    ])
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    newCont(
                        contColor: Color.fromARGB(255, 68, 251, 1),
                        textData: ("Green"),
                        c_h: 150,
                        c_w: 350)
                  ],
                ),
              ],
            ))),
  );
}

// Container newCont({Color contColor = Colors.blue, String? textData}) {
//   return Container(
//       height: 200,
//       width: 350,
//       color: contColor,
//       child: Center(
//         child: Text(textData!),
//       ));
// }   Here if null is given, we will see an error.
Container newCont(
    {Color contColor = Colors.blue,
    required String textData,
    required double c_h,
    required double c_w}) {
  return Container(
      height: c_h,
      width: c_w,
      color: contColor,
      child: Center(
        child: Text(textData),
      ));
}
