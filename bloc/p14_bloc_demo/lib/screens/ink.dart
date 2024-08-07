import 'package:flutter/material.dart';

class InkDemo extends StatefulWidget {
  const InkDemo({super.key});

  @override
  State<InkDemo> createState() => _InkDemoState();
}

class _InkDemoState extends State<InkDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('Gesture detector');
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 50,
          width: 50,
        ),
        InkWell(
          // adds an animation of ripple effect for the given ink object which is similar to a container in all properties.Change shape with decorations
          splashColor: Colors.amber,
          child: Ink(
            height: 200,
            width: 200,
            color: Color.fromARGB(255, 73, 244, 54),
          ),
        ),
      ],
    );
  }
}
