import 'package:flutter/material.dart';

class MYLI extends StatelessWidget {
  const MYLI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "  MyList",
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
                sq(name: 'assets/orignal (1).jpeg'),
                sq(name: 'assets/orignal (2).jpeg'),
                sq(name: 'assets/orignal (3).jpeg'),
              ],
            ))
      ],
    );
  }
}

class sq extends StatelessWidget {
  String? name;
  sq({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: 200,
          width: 125,
          color: Color.fromARGB(255, 140, 144, 141),
        ),
        Image(
          image: AssetImage(name!),
        ),
      ]),
    );
  }
}
