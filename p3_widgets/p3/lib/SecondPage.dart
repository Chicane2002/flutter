import 'package:flutter/material.dart';
import 'package:p3/ItemContainer.dart';
import 'package:p3/button.dart';
// Just write st and you will get option for all the basic code in stateful widget

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            print("The current value of count is ${count.toString()}.");
            setState(
                () {}); //rebuilds whole page again instead of updating a single widget
          },
          child: const Text("Add"),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              ItemContainer(
                  contcolor: Colors.green,
                  textData: "\nThe value of count is ${count.toString()}.",
                  h: MediaQuery.of(context).size.height,
                  w: MediaQuery.of(context).size.width),
              IconButton(
                onPressed: () {
                  count--;
                  print("The current value of count is ${count.toString()}.");
                  setState(
                      () {}); //rebuilds whole page again instead of updating a single widget
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ]));
  }
}
