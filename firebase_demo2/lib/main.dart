import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo2/screens/registerPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: RegisterPage(),
    debugShowCheckedModeBanner: false,
  ));
}
