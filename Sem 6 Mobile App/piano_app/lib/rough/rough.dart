// ignore_for_file: unnecessary_string_interpolations

/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Piano App'),
        ),
        body: PianoBody(),
      ),
    );
  }
}

class PianoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final keyWidth = screenWidth / 16; // Adjust the divisor as needed
    final keyHeight = screenHeight / 5; // Adjust the divisor as needed

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                ),
                child: Stack(
                  children: [
                    Row(children: [
                      for (int i = 0; i < 16; i++)
                        Flexible(
                          child: Container(
                            width: keyWidth,
                            height: keyHeight * 2,
                            child: PianoKeyButton(),
                          ),
                        ),
                    ]),
                    Row(
                      children: [
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 60 / 100,
                        )),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 60 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 50 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 50 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 60 / 100,
                        )),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 60 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 44 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 44 / 100,
                        )),
                        Flexible(
                          child: PianoKeyButton(
                              width: keyWidth,
                              height: keyHeight,
                              keyColor: Colors.black),
                        ),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                        Flexible(
                            child: SizedBox(
                          height: 2,
                          width: keyWidth * 52 / 100,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PianoKeyButton extends StatelessWidget {
  final Color keyColor;
  final double width;
  final double height;

  PianoKeyButton({
    this.keyColor = Colors.white,
    this.width = 25, // Default width
    this.height = 100, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: GestureDetector(
        onLongPress: () => {},
      ),
      decoration: BoxDecoration(
        color: keyColor,
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: width / 10, // Adjust the divisor as needed
          ),
          // right: BorderSide(
          //   color: Colors.black,
          //   width: width / 10, // Adjust the divisor as needed
          // ),
        ),
      ),
    );
  }
}

//   FloatingActionButton p_key() {
//     String? key_name;
    
//     return FloatingActionButton(
//       onPressed: (){},
//       child: const Text('$key_name'),
//     );
//   }
// }

                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        Container(
                          width: keyWidth * 26 / 17,
                          height: keyHeight * 25 / 16,
                          child: PianoKeyButton(),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PianoKeyButton extends StatelessWidget {
  final Color keyColor;
  final double width;
  final double height;

  PianoKeyButton({
    this.keyColor = Colors.white,
    this.width = 25, // Default width
    this.height = 100, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: keyColor,
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: width / 10, // Adjust the divisor as needed
          ),
          // right: BorderSide(
          //   color: Colors.black,
          //   width: width / 10, // Adjust the divisor as needed
          // ),
        ),
      ),
    );
  }
}

//   FloatingActionButton p_key() {
//     String? key_name;
    
//     return FloatingActionButton(
//       onPressed: (){},
//       child: const Text('$key_name'),
//     );
//   }
// }
*/