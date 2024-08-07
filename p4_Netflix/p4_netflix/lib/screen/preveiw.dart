import 'package:flutter/material.dart';

class PREVEIW extends StatelessWidget {
  const PREVEIW({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "  Previews",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 32),
        ),
        Container(
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(65, 251, 60, 60),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                circ(name: 'assets/orignal (1).jpeg'),
                circ(name: 'assets/orignal (2).jpeg'),
                circ(name: 'assets/orignal (3).jpeg'),
                circ(name: 'assets/orignal (4).jpeg'),
                circ(name: 'assets/orignal (5).jpeg'),
              ],
            ))
      ],
    );
  }
}

class circ extends StatelessWidget {
  String? name;
  circ({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(alignment: Alignment.center, children: [
        const CircleAvatar(
          radius: 75,
          backgroundColor: Color.fromARGB(255, 140, 144, 141),
        ),
        CircleAvatar(
          radius: 65,
          backgroundImage: AssetImage(name!),
        ),
      ]),
    );
  }
}
