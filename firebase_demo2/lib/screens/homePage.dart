import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({required String? loginEmail, super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? loginEmail;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: Column(
          children: [
            Text('Home'),
          ],
        ),
      ),
    );
  }
}
