import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestoreDB = FirebaseFirestore.instance;

  registerUser({
    required String firstn,
    required String lastn,
    required String regemailId,
    required String phoneNo,
    required String regPwd,
  }) async {
    UserCredential userCreds = await _auth.createUserWithEmailAndPassword(
        email: regemailId, password: regPwd);
    storeDataInFirestore(
        firstn: firstn,
        lastn: lastn,
        firestoreemailId: regemailId,
        phoneNo: phoneNo,
        firestorePwd: regPwd);
    return userCreds.user!.email;
  }

  storeDataInFirestore({
    required String firstn,
    required String lastn,
    required String firestoreemailId,
    required String phoneNo,
    required String firestorePwd,
  }) {
    Map<String, dynamic> userDataMap = {
      'fname': firstn,
      'secondname': lastn,
      'fireemail': firestoreemailId,
      'pno': phoneNo,
      'fPwd': firestorePwd
    };
    firestoreDB
        .collection('userData')
        .doc(firestoreemailId)
        .set(userDataMap)
        .whenComplete(() {
      print('User data successfully added.');
    });
  }

  loginUser({required String loginEmail, required String loginPwd}) async {
    UserCredential loginCreds = await _auth.signInWithEmailAndPassword(
        email: loginEmail, password: loginPwd);
    if (loginCreds.user != null) {
      print('Login Success');
      return loginCreds.user!.email;
    }

  }
}
