import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo2/screens/homePage.dart';
import 'package:firebase_demo2/screens/login_Page.dart';
import 'package:flutter/material.dart';

import '../services/userAuth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: Column(
          children: [
            TextformfieldCard('First Name', firstnamecont),
            sbox(),
            TextformfieldCard('Second Name', snamecont),
            sbox(),
            TextformfieldCard('E-Mail ID', emailcont),
            sbox(),
            TextformfieldCard('Phone Number', phonenumbercont),
            sbox(),
            TextformfieldCard('Password', pwdcont),
            sbox(),
            OutlinedButton(
                onPressed: () async {
                  //_formkey.currentState!.validate();
                  String userEmail = await FirebaseAuth.registerUser(
                    firstn: firstnamecont.text,
                    lastn: snamecont.text,
                    regemailId: emailcont.text,
                    phoneNo: phonenumbercont.text,
                    regPwd: pwdcont.text,
                  );
                  print(
                      'The user has been registered with email ID: $userEmail');
                },
                child: const Text('Accept')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                },
                child: Text('Log in'))
          ],
        )),
      ),
    );
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
