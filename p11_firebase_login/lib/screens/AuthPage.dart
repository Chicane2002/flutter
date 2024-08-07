import 'package:flutter/material.dart';
import 'package:p11_firebase_login/screens/homePage.dart';
import 'package:p11_firebase_login/services/UserAuth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isPasswordShow = false;
  bool isRegisterPageShow = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailControllerRegister =
      TextEditingController();
  final TextEditingController _passwordControllerRegister =
      TextEditingController();

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();

  UserAuth _auth = UserAuth();
  String? _validatePwdLength(String? value) {
    if (value!.length <= 8) {
      return 'Minimun 8 Chars';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return isRegisterPageShow
        ? SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "LOGIN PAGE",
                        style: TextStyle(fontSize: 35),
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _emailController.clear();
                                // _emailController.text = '';
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.blue,
                            filled: true,
                            hintText: "Please enter your email",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        // validator: _validatePwdLength
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !isPasswordShow,
                        obscuringCharacter: '⬤',
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isPasswordShow = !isPasswordShow;
                                setState(() {});
                              },
                              child: Icon(
                                isPasswordShow
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.blue,
                            filled: true,
                            hintText: "Please enter your password",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        validator: _validatePwdLength,
                      ),
                      TextButton(
                          onPressed: () {
                            isRegisterPageShow = !isRegisterPageShow;

                            setState(() {});
                          },
                          child: const Text(
                              "Don't have an Account? Register Now")),
                      OutlinedButton(
                          onPressed: () async {
                            _formKey.currentState!.validate();
                            String email = await _auth.loginUser(
                              logmail: _emailController.text,
                              logPassword: _passwordController.text,
                            );
                            print("${email} tried to log in");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Home(email: email)));
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text("I AM THE BUTTON")));
                          },
                          child: const Text("LOGIN NOW"))
                    ],
                  ),
                )),
          )))
        : SafeArea(
            child: Scaffold(
                body: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            "REGISTER PAGE",
                            style: TextStyle(fontSize: 35),
                          ),
                          TextFormField(
                            controller: fname,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _emailController.clear();
                                    // _emailController.text = '';
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.blue,
                                filled: true,
                                hintText: "First Name",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // validator: _validatePwdLength
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFormField(
                            controller: lname,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _emailController.clear();
                                    // _emailController.text = '';
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.blue,
                                filled: true,
                                hintText: "Last Name",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // validator: _validatePwdLength
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFormField(
                            controller: phone,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _emailController.clear();
                                    // _emailController.text = '';
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.blue,
                                filled: true,
                                hintText: "Phone Number",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // validator: _validatePwdLength
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFormField(
                            controller: _emailControllerRegister,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _emailController.clear();
                                    // _emailController.text = '';
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.blue,
                                filled: true,
                                hintText: "Please enter your email",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // validator: _validatePwdLength
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          TextFormField(
                            controller: _passwordControllerRegister,
                            obscureText: !isPasswordShow,
                            obscuringCharacter: '⬤',
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    isPasswordShow = !isPasswordShow;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    isPasswordShow
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                fillColor: Colors.blue,
                                filled: true,
                                hintText: "Please enter your password",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            validator: _validatePwdLength,
                          ),
                          TextButton(
                              onPressed: () {
                                isRegisterPageShow = !isRegisterPageShow;
                                setState(() {});
                              },
                              child: const Text("Go back to Login Page")),
                          OutlinedButton(
                              onPressed: () {
                                // _formKey.currentState!.validate();
                                _auth.createNewUser(
                                    firstName: fname.text,
                                    lastName: lname.text,
                                    phoneNumber: phone.text,
                                    regEmail: _emailControllerRegister.text,
                                    regPassword:
                                        _passwordControllerRegister.text);

                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(
                                //         content: Text("I AM THE BUTTON")));
                              },
                              child: Text(isPasswordShow
                                  ? "LOGIN NOW"
                                  : "REGISTER NOW"))
                        ],
                      ),
                    ))));
  }
}
