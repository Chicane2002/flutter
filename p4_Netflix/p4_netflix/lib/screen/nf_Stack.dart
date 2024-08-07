import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/crown.jpg"),
        Positioned(
          bottom: 200,
          left: MediaQuery.of(context).size.width * 0.15,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 30,
                  width: 60,
                  color: Color.fromARGB(255, 174, 174, 174),
                  child: Center(
                    child: Text(
                      "List",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 30,
                  width: 60,
                  color: Color.fromARGB(255, 174, 174, 174),
                  child: Center(
                    child: Text(
                      "Play",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 30,
                  width: 60,
                  color: Color.fromARGB(255, 174, 174, 174),
                  child: Center(
                    child: Text(
                      "Info",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
