import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  late String email;
  Home({required this.email, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Hi ${widget.email}"),
      ),
    ));
  }
}
