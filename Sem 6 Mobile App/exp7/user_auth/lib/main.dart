import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: homescreen(),
    );
  }
}

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var Namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var Passwordcontroller = TextEditingController();
  var savedvalue = "";
  var savedvalue2 = "";
  var savedvalue3 = "";
  @override
  void initState() {
    super.initState();
    getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("User Authorisation")),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Login Page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            controller: Namecontroller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                label: Text("name")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                label: Text("E-mail id")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            controller: Passwordcontroller,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                label: Text("password")),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              var name = Namecontroller.text.toString();
                              var email = emailcontroller.text.toString();
                              var password = Passwordcontroller.text.toString();
                              var prefs = await SharedPreferences.getInstance();
                              prefs.setString("name", name);
                              prefs.setString("email", email);
                              prefs.setString("password", password);
                            },
                            child: Text("Login"))
                      ],
                    ),
                  ),
                  height: 450,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                ),
              ),
              Text(savedvalue),
              Text(savedvalue2),
              Text(savedvalue3),
            ],
          ),
        ),
      ),
    );
  }

  void getvalues() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString("name");
    var getmail = prefs.getString("email");
    var getpass = prefs.getString("password");
    savedvalue = getname ?? "";
    savedvalue2 = getmail ?? "";
    savedvalue3 = getpass ?? "";
    setState(() {});
  }
}
