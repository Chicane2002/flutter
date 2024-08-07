import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p11_firebase_login/screens/AuthPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthScreen(),
  ));
}
