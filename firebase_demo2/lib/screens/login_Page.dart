import 'package:firebase_demo2/screens/homePage.dart';
import 'package:flutter/material.dart';

import '../services/userAuth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormFieldState> _formkey = GlobalKey();

  userAuth FirebaseAuth = userAuth();
  TextEditingController firstnamecont = TextEditingController();
  TextEditingController snamecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController phonenumbercont = TextEditingController();
  TextEditingController pwdcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Form(
                child: Column(children: [
      TextformfieldCard('E-Mail ID', emailcont),
      sbox(),
      TextformfieldCard('Password', pwdcont),
      sbox(),
      OutlinedButton(
          onPressed: () async {
            String loginEmail = await FirebaseAuth.loginUser(
                loginEmail: emailcont.text, loginPwd: pwdcont.text);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Homepage(loginEmail: loginEmail)));
          },
          child: Text('Sign in'))
    ]))));
  }

  Card TextformfieldCard(
    String? htext,
    TextEditingController? cont,
    //  Function val
  ) {
    return Card(
      elevation: 15,
      child: TextFormField(
        controller: cont,
        // validator: (value) => val,
        decoration: InputDecoration(hintText: htext),
      ),
    );
  }

  SizedBox sbox() => const SizedBox(
        height: 20,
      );
}
