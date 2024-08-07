import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuth {
  FirebaseAuth fauth = FirebaseAuth.instance;
  FirebaseFirestore userDatabase = FirebaseFirestore.instance;
  createNewUser({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String regEmail,
    required String regPassword,
  }) async {
    print("firstName: $firstName\nemail: $regEmail");
    try {
      UserCredential userCred = await fauth.createUserWithEmailAndPassword(
          email: regEmail, password: regPassword);
      print("Registration Success");

      _RegisterUserDetails(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          regEmail: regEmail,
          regPassword: regPassword);
    } catch (err) {
      print("Found: $err");
    }
    //     .whenComplete(() {
    //   print("Registration Success");
    // }).catchError((error) {
    //   print("Error is: $error");
    // });
  }

  _RegisterUserDetails({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String regEmail,
    required String regPassword,
  }) async {
    Map<String, dynamic> userDetails = {
      "first name": firstName,
      "last name": lastName,
      "phone number": phoneNumber,
      "email": regEmail,
      "password": regPassword,
    };
    // doc(dockiId).set(enterDataInDoc)
    try {
      await userDatabase.collection("collName").doc(regEmail).set(userDetails);
      // await userDatabase.collection("collName").doc(regEmail).update({"pass": "newPass"}); matches by docID
      // setOptions see that also
    } catch (error) {
      print("while entering Data:\nFound: $error");
    }
  }

  loginUser({
    required String logmail,
    required String logPassword,
  }) async {
    try {
      UserCredential loginCred = await fauth.signInWithEmailAndPassword(
          email: logmail, password: logPassword);
      print("${loginCred.user!.email} logged in 👍👍🏻👍🏼");
      return loginCred.user!.email;
    } catch (error) {
      print("while logging in\nFound: ${error}");
    }
  }

  googleSignIN() async {
    GoogleSignInAccount? gAccount = await GoogleSignIn().signIn();

    GoogleSignInAuthentication gAuth = await gAccount!.authentication;

    AuthCredential creds = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    UserCredential googleUserCreds = await fauth.signInWithCredential(creds);

    print(
        "This is the data from the google sign in account ${googleUserCreds.user!.displayName}");
  }
}
